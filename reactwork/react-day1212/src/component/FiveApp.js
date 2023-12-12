import React, { useRef, useState } from 'react';

function FiveApp(props) {

    const [result,setResult]=useState('');
    const nameRef=useRef('');
    const javaRef=useRef('');
    const springRef=useRef('');
    const reactRef=useRef('');

    const buttonResult=()=>{
        //데이터 읽어오기
        let name=nameRef.current.value; //nameRef에 현재 입력한 값
        let java=Number(javaRef.current.value);
        let spring=Number(springRef.current.value);
        let react=Number(reactRef.current.value);

        let tot=java+spring+react;
        let avg=(tot/3).toFixed(2);//.toFixed(2) 소수점 2자리



        let r=`[결과확인]
        이름: ${name}
        자바점수: ${java}
        스프링점수: ${spring}
        리액트점수: ${react}
        총점: ${tot}
        평균: ${avg}`;

        setResult(r); //결과확인을 한 변수에 담아줘서 바로 setResult에 담아주면 아래에서 추가로 안적어줘도 된다
    }

    return (
        <div>
            <h3 className='alert alert-success'>FiveApp입니다_useRef예제</h3>
                                        {/* const로 ref 설정한 값들 가져오기 */}
            <h4>이름입력: <input type='text' ref={nameRef}/></h4>
            <h4>자바점수: <input type='text' ref={javaRef}/></h4>
            <h4>스프링점수: <input type='text' ref={springRef}/></h4>
            <h4>리액트점수: <input type='text' ref={reactRef}/></h4>
            <button type='button' className='btn btn-info'
            onClick={buttonResult}>결과확인</button>

                                                    {/* 백틱 형식 그래도 가져올 수 있는 style */}
            <h2 className='alert alert-info' style={{whiteSpace:'pre-wrap'}}>{result}</h2>
        </div>
    );
}

export default FiveApp;