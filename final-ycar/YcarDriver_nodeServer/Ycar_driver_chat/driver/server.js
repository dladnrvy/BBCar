const express = require('express');
const app = express();
 
const http = require('http');
const server = http.Server(app);
 
const socket = require('socket.io');
const io = socket(server);
 
const port = 3000;
let socketList = [];

app.get('/', (req, resp) => {
    resp.send('hello :)');
});
 
io.on('connection', (socket) => {
    socketList.push(socket);
    console.log('User Join');
 
    socket.on('SEND', (msg) => {
        console.log(msg);
        
        //나를 제외한 모든 사람에게 보내기인데, 나는 1:1이라 고쳐야 함.
        socketList.forEach((item, i) => {
            // console.log('id',item.id);
            if(item != socket){
                item.emit('SEND', msg);
            }
        });
    });

    socket.on('disconnect', () =>{
        socketList.splice(socketList.indexOf(sockete), 1);
    });
});
 
server.listen(port, () => {
    console.log('Server On !');
});
