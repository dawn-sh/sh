import React, { useEffect, useState } from 'react';

function OneApp(props) {

    const [name,setName]=useState('강호동');
    const [addr,setAddr]=useState('서울시');

    //useEffect : 값 입력시 계속해서 랜더링되며 호출될 수도 있고 생성자처럼 딱 한 번 호출될 수도 있음
    
    //변경시 마다 호출
    //평상시마다 기본으로 깔려있다고 생각
    /*useEffect(()=>{
        console.log("state변수가 값 변경시 마다 호출");
    })*/

    /*useEffect(()=>{
        console.log("처음 랜더링시 한번만 호출..생성자처럼");
    },[]); 1회용*/

    useEffect(()=>{
        console.log("이름변경시에만 호출");
    },[name]);

    return (
        <div>
            <h3 className='alert alert-danger'>OneApp입니다_useEffect</h3>
            <h3>이름: <input type='text' className='form-control' style={{width:'200px'}} defaultValue={name}
            onChange={(e)=>{
                setName(e.target.value);
            }}/></h3>
            <h3>주소: <input type='text' className='form-control' style={{width:'200px'}} defaultValue={addr}
            onChange={(e)=>{
                setAddr(e.target.value);
            }}/></h3>
            <hr/>
            <h2>이름: {name}</h2>
            <h2>주소: {addr}</h2>
        </div>
    );
}

export default OneApp;