<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>chat room</title>
    <!-- 한글 폰트 -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <style>
        #container {
            width: 400px;
            height: 600px;
            border: 1px solid black;
            background: #FFFEF4;
            margin: 50px auto;
            font-family: 'Noto Sans KR', sans-serif;
        }
        #chatView {
            height: 90%;
            overflow-y: scroll;
        }
        #chatForm {
            height: 10%;
            border-top: 1px solid black;
            text-align: center;
        }
        #msg {
            width: 70%;
            height: 40%;
            line-height: 32px;
            border-radius: 8px;
            margin: 10px 0;
            padding: 5px;
            font-family: 'Noto Sans KR', sans-serif;
        }
        #send {
            width: 16%;
            height: 34px;
            border-radius: 50px;
            background: #413A6D;
            color: white;
            font-family: 'Noto Sans KR', sans-serif;
            margin-left: 5px;
        }
        .msgLine {
            margin: 15px;
        }
        .msgBox {
            border: 1px solid black;
            background: skyblue;
            padding: 2px 5px;
            border-radius: 10px;
            font-size: 14px;
        }
        .me {
            color: #fff;
        }

    </style>
</head>
<body>
    <div id="container">
        <div id="chatView">
        </div>
        <form id="chatForm" onsubmit="return false">
            <input type="text" id="msg">
            <input type="submit" id="send" value="전송">
        </form>
    </div>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="http://localhost:3000/socket.io/socket.io.js"></script>
 
    <script>
        const socket = io('http://localhost:3000');
        
        let chatView = document.getElementById('chatView');
        let chatForm = document.getElementById('chatForm');
 
        chatForm.addEventListener('submit', () => {
            let msg = $('#msg');
 
            if (msg.val() == '') {
                return;
 
            } else {
                socket.emit('SEND', msg.val());
 
                let msgLine = $('<div class="msgLine">');
                let msgBox = $('<div class="me msgBox">');
 
                msgBox.append(msg.val());
                msgBox.css('display', 'inline-block');
                msgLine.css('text-align', 'right');
                msgLine.append(msgBox);
 
                $('#chatView').append(msgLine);
                
                msg.val('');
                chatView.scrollTop = chatView.scrollHeight;
            }
        });
        
        socket.on('SEND', (msg) => {
            
            let msgLine =  $('<div class="msgLine">');
            let msgBox = $('<div class="msgBox">');
            
            msgBox.append(msg);
            msgBox.css('display', 'inline-block');
            msgLine.append(msgBox);
            
            $('#chatView').append(msgLine);
            chatView.scrollTop = chatView.scrollHeight;
            
        });
    </script>
</body>
</html>