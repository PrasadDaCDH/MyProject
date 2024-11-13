#monitoring & loging

import psutil

cpu_per= psutil.cpu_percent(interval=1)
memory_info= psutil.virtul.memory()

print(f'The current cpu percentage is {cpu_per}%')
print(f'The current memory percentage is {memory_info.percent}%')