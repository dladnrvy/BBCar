var app = require('express')();
var http = require('http').createServer(app);
var io = require('socket.io')(http);

app.get('/', function(req, res){
    //res.send('<h1>안녕하세요 "/" 경로 입니다.</h1>');
  });
  
io.on('connection', function(socket){
    console.log('user connected ::', socket.id);
    io.emit('alert', 'connected!');
    socket.on('disconnect', function(){
        console.log('user disconnected ::', socket.id);
    });
});
http.listen(3000, function(){
    console.log('연차 노드 서버 연결 완료');
})