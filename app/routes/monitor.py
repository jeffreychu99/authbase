from ..base import base
from flask import request, jsonify
from flask_login import login_required
from .. import permission
import time
import sys
import os
import psutil
import socket
import platform
from .. import setup_logger

logger = setup_logger(__name__)
# 记录应用启动时间
start_time = time.time()

@base.route('/monitor/server')
@login_required
@permission('monitor:server:list')
def server():
     # 计算运行时长
    uptime = time.time() - start_time
    
    # 计算年、月、天、小时和分钟
    years, remainder = divmod(uptime, 31536000)  # 365天
    months, remainder = divmod(remainder, 2592000)  # 30天
    days, remainder = divmod(remainder, 86400)  # 1天
    hours, remainder = divmod(remainder, 3600)  # 1小时
    minutes, seconds = divmod(remainder, 60)  # 1分钟

    # 构建可读格式
    uptime_human_readable = []
    if years > 0:
        uptime_human_readable.append(f"{int(years)}年")
    if months > 0:
        uptime_human_readable.append(f"{int(months)}月")
    if days > 0:
        uptime_human_readable.append(f"{int(days)}天")
    if hours > 0:
        uptime_human_readable.append(f"{int(hours)}小时")
    if minutes > 0:
        uptime_human_readable.append(f"{int(minutes)}分钟")

    # 如果没有可读格式，显示“0分钟”
    if not uptime_human_readable:
        uptime_human_readable.append("0分钟")

    statistics = {
        'version': sys.version,
        'home': sys.executable,
        'inputArgs': sys.argv,
        'startTime': time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(start_time)),
        'runTime': ' '.join(uptime_human_readable)  # 用空格连接可读格式
    }

    disk_partitions = psutil.disk_partitions()
    disk_details = []
    for partition in disk_partitions:
        try:
            partion_info = psutil.disk_usage(partition.mountpoint)
            disk_details.append({
                "dirName": partition.device,
                "sysTypeName": partition.fstype,
                "typeName": partition.mountpoint,
                "total": round(partion_info.total / (1024 ** 3), 1),  # 转换为GB
                "free": round(partion_info.free / (1024 ** 3), 1),  # 转换为GB
                "used": round(partion_info.used / (1024 ** 3), 1),  # 转换为GB
                "usage": round(partion_info.percent, 1)  # 百分比
            })
        except PermissionError:
            logger.error(f"PermissionError: {partition.mountpoint} - 无法访问该分区")

    memory = psutil.virtual_memory()

    return jsonify({
        'msg': '操作成功',
        'code': 200,
        'data': {
            'jvm': statistics,
            'sys': {
                'userDir': os.getcwd(),
                "computerName": socket.gethostname(),
                "computerIp": socket.gethostbyname(socket.gethostname()),
                "osName": platform.system(),
                "osArch": platform.architecture()[0]
            },
            'cpu': {
                'cpuNum': psutil.cpu_count(),  # CPU 核心数
                'used': psutil.cpu_percent(interval=1, percpu=False),  # 用户使用率
                'sys': psutil.cpu_percent(interval=1, percpu=False),  # 系统使用率
                'free': 100 - psutil.cpu_percent(interval=1, percpu=False)  # 空闲率
            },
            "mem": {
                "total": round(memory.total / (1024 ** 3), 2),  # 转换为GB
                "used": round(memory.used / (1024 ** 3), 2),  # 转换为GB,
                "free": round(memory.available / (1024 ** 3), 2),  # 转换为GB,
                "usage": memory.percent
            },
            'sysFiles': disk_details
        }
    })
