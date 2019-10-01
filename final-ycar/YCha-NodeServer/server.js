var app = require('express')();
var http = require('http').createServer(app);
var io = require('socket.io')(http);

app.get('/', function(req, res){});
  
io.on('connection', function(socket){
    //운행 도착 room 
    var room = new Array();
    var roomIdx;

    //결제 room 
    var payroom = new Array();
    var payRoomIdx;

    //운행 시작 room
    var startroom = new Array();
    var startRoomIdx;

    console.log('클라이언트 연결됨. 소켓 id는 : ', socket.id);

    socket.on('disconnect', function(){
        console.log('사용자 연결 종료 ::', socket.id);
    });

    //운행 종료 시 room join 처리
    socket.on('join room', function(r_idx){
        console.log('r_idx 로 룸 조인 ', r_idx);
        
        roomIdx = room.indexOf('room'+r_idx);
        if(r_idx != null  && roomIdx == -1) { //만약 r_idx 번 방이 존재하지 않다면,
            room.push('room'+r_idx); //신규 방 생성 
            console.log('신규 방 생성 : '+r_idx);
            console.log('현재 방 배열 : ', room);
        }

        roomIdx = room.indexOf('room'+r_idx);
        socket.join(room[roomIdx], function(){
            console.log(roomIdx+'번 룸에 조인됨');
        });
    });

    socket.on('arrive', function(r_idx){
        console.log('arrive 이벤트 리슨');
        io.to(room[roomIdx]).emit('redirect', r_idx);
    });

    //결제 완료시 room join 처리 
    socket.on('join payroom', function(r_idx){
        console.log('r_idx 로 결제 룸 조인 ', r_idx);
                
        payRoomIdx = payroom.indexOf('payroom'+r_idx);
        if(r_idx != null  && payRoomIdx == -1) { //만약 r_idx 번 방이 존재하지 않다면,
            payroom.push('payroom'+r_idx); //신규 방 생성 
            console.log('신규 결제 방 생성 : '+r_idx);
            console.log('현재 결제 방 배열 : ', payroom);
        }

        payRoomIdx = payroom.indexOf('payroom'+r_idx);
        socket.join(payroom[payRoomIdx], function(){
            console.log(payRoomIdx+'번 결제 룸에 조인됨');
            io.to(payroom[payRoomIdx]).emit('payroom result', payRoomIdx+'번 방에 조인되었습니다.');
        });
    });

    socket.on('send payinfo', function(
        payidx, paydate, d_commute, d_distance, d_fee, paymethod, 
        d_starttime, d_startpoint, d_endtime, d_endpoint
    ){
        console.log('payinfo 이벤트 리슨 ', d_endpoint);
        io.to(payroom[payRoomIdx]).emit('receive pay result', 
        payidx, paydate, d_commute, d_distance, d_fee, paymethod, 
        d_starttime, d_startpoint, d_endtime, d_endpoint);
    });

    //운행 시작 시 room join 처리 
    socket.on('join start room', function(r_idx) {
        console.log('r_idx 로 운행시작 룸 조인 ', r_idx);
             
        startRoomIdx = startroom.indexOf('startroom'+r_idx);
        if(r_idx != null  && startRoomIdx == -1) { //만약 r_idx 번 방이 존재하지 않다면,
            startroom.push('startroom'+r_idx); //신규 방 생성 
            console.log('신규 결제 방 생성 : '+r_idx);
            console.log('현재 결제 방 배열 : ', startroom);
        }

        startRoomIdx = startroom.indexOf('startroom'+r_idx);
        socket.join(startroom[startRoomIdx], function(){
            console.log(startRoomIdx+'번 운행시작 룸에 조인됨');
            io.to(startroom[startRoomIdx]).emit('startroom join result', startRoomIdx+'번 방에 조인되었습니다.');
        });
    });

    socket.on('start journey', function(r_idx){
        console.log('start journey 이벤트 리슨 : ', r_idx);
        io.to(startroom[startRoomIdx]).emit('go driving page', r_idx);
    });



});
http.listen(3000, function(){
    console.log('연차 노드 서버 연결 시작');
});