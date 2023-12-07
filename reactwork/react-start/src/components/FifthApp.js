import React, { useState } from 'react';

function FifthApp(props) {

    const [name,setName]=useState('');
    const [java,setJava]=useState(0);
    const [react,setReact]=useState(0);
    const [total,setTotal]=useState(0);
    const [avg,setAvg]=useState(0);



    return (

        <div>
            <h3 className='alert alert-danger'>FifthApp입니다</h3>
            <div className='inp'>
                이름: <input type='text' style={{width:'100px'}} defaultValue={name}
                onChange={(name)=>{
                    setName(name.target.value);
                }}/>
                <span style={{marginLeft:'10px'}}>{name}</span><br/><br/>
                자바점수: <input type='text' style={{width:'100px'}} defaultValue={java}
                onChange={(java)=>{
                    setJava(java.target.value);
                }}/>
                <span style={{marginLeft:'10px'}}>{java}</span><br/><br/>
                리액트점수: <input type='text' style={{width:'100px'}} defaultValue={react}
                onChange={(react)=>{
                    setReact(react.target.value);
                }}/>
                <span style={{marginLeft:'10px'}}>{react}</span><br/><br/>

                <button type='button' className='btn btn-outline-info'
                onClick={()=>{
                    setTotal(Number(java)+Number(react));
                    setAvg((Number(java)+Number(react))/2);
                }}>결과보기</button>
            </div>
            <div className='result'>
                <span>이름: {name}</span><br/>
                <span>자바점수: {java}</span><br/>
                <span>리액트점수: {react}</span><br/>
                <span>총점: {total}</span><br/>
                <span>평균: {avg}</span>
            </div>
        </div>
    );
}

export default FifthApp;