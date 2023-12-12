import React, { useRef, useState } from 'react';

function FourApp(props) {

    //useRef: 변수관리하는 기능
    //state와의 차이점: 값이 변경되어도 다시 렌더링 하지 않음

    //일반 state변수
    const [count,setCount]=useState(0);
    //ref 선언하는법
    const countRef=useRef(0);

    //state변수 증가하는 함수
    const stateIncre=()=>{
        setCount(count+1);
    }

    //ref변수 증가하는 함수
    const refIncre=()=>{
        countRef.current=countRef.current+1; //ref변수.current(current는 정해진 변수)
        console.log("countRef: "+countRef.current); //렌더링이 안되므로 콘솔로 확인 // 다른버튼 누르는 순가 증가된 값이 div에 출력됨
    }



    return (
        <div>
            <h3 className='alert alert-secondary'>FourApp입니다_useRef</h3>
            <button type='button' className='btn btn-danger'
            onClick={stateIncre}>state 변수 증가</button>
            <div className='number'>{count}</div>
            <button type='button' className='btn btn-info'
            onClick={refIncre}>ref 변수 증가</button>
            <div className='number'>{countRef.current}</div>
        </div>
    );
}

export default FourApp;