import React, { useState } from 'react';
import img1 from '../image/4.jpeg'

function ThirdApp(props) {


    // 상태관리를 위한 변수 설정
    // 상태변수라 상수 const로 사용
    // 상태 변수는 setMessage로 message 수정해줄 수 있음 [message,setMessage] / [변수,set변수]
    const [message,setMessage]=useState('Happy Day') //useState라는 훅스를 쓰는 순간 위에 import React, { useState } from 'react';로 import됨
    // useState('넣을 값 입력') ()이렇게 빈값으로 주면 비어있는 값


    //엔터 이벤트 함수
    const enterEvent=(e)=>{

        //엔터 치는 순간 값을 비워주는 이벤트
        if(e.keyCode===13){ // e.key==='Enter'로도 줄 수 있음
            setMessage('');
            e.target.value='';
        }
    }



    return (
        <div>
            <h3 className='alert alert-info'>ThirdApp입니다
            <img src={img1} style={{width:'30px'}}/></h3>
            <h3 style={{color:'red'}}>{message}</h3>
            <h4>메세지를 입력해 주세요</h4>
            <input type='text' style={{width:'300px',fontSize:'2em'}}
            defaultValue={message}
            // onChange가 바로 변환되는 이벤트
            // 이렇게 이벤트 줄 수도 있고, 위에 함수 만들어서 호출하는 방법도 있음
            onChange={(e)=>{
                console.log(e.target.value); // 웹 console을 열어보면 바로바로 나옴
                //message변수에 입력 값 넣기
                setMessage(e.target.value); // e라는 인자값에 target을 주는데 value라는 것을 준다는 이벤트(메소드아님)/ 위에 message를 setMessage로 바로 바꿔줄 수 있는 이벤트
            }}
            // 위에 만들어준 함수 호출
            // onKeyup은 키 입력했을 경우 변환되는 이벤트
            onKeyUp={enterEvent}
            />
            {/* defaultValue={message}로 상수에 준 message를 받아올 수 있음 */}
            {/* onChange={(e)=>{ =>는 (e)함수에 넣어줄 이벤트 입력가능
                console.log(e.target.value); e 인자값에 바로 값을 주는 것을 .target.value
                //message변수에 입력 값 넣기
                setMessage(e.target.value); // 위에 setMessage를 바로 바꿔줄 수 있는 이벤트
                }}
            */}
        </div>
    );
}

export default ThirdApp;