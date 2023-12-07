import React, { useState } from 'react';
import img2 from '../image/6.jpeg'

function FourthApp(props) {

    const [name,setName]=useState('장순영');
    const [age,setAge]=useState(22);



    return (

        <div>
            <h3 className='alert alert-info'>FourthApp입니다
            <img src={img2} className='img-thumbnail' style={{width:'40px',marginLeft:'50px'}}/></h3>
            <b style={{fontSize:'25px'}}>이름:{name} <span style={{marginLeft:'20px'}}>나이:{age}세</span></b>
            <br/><br/>
            <button type='button' className='btn btn-info'
            onClick={()=>{
                setName('김영환');
                setAge(25);
            }}>값변경</button>

            <button type='button' className='btn btn-info'
            style={{marginLeft:'20px'}}
            onClick={()=>{
                setName('장순영');
                setAge(22);
            }}>초기화</button>
        </div>
    );
}

export default FourthApp;