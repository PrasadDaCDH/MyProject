import socket

# Create a socket object
client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Define the host and port to connect to
host = '127.0.0.1'  # localhost
port = 12345

# Connect to the server
client_socket.connect((host, port))

# Send a message to the server
message = "Hello, server!"
client_socket.send(message.encode('utf-8'))

# Receive data from the server
data = client_socket.recv(1024).decode('utf-8')
print(f'Received from server: {data}')

# Close the socket
client_socket.close()
