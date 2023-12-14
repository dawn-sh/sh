import React, { useState } from 'react';

function WriteForm({onSave}) {

    const[name,setName]=useState('');
    const[blood,setBlood]=useState('A');
    const[photo,setPhoto]=useState('01');
    
    //부모에게서 밭은 버튼 이벤트
    const addDataEvent=()=>{
        //부모 컴포넌트에서 만든 onSave를 호출
        onSave({name,photo,blood});
    }

    return (
        <div>
            <b>이름: </b>
            <input type='text' style={{width:'120px'}}
            onChange={(e)=>{
                setName(e.target.value);
            }}/>

            <b style={{marginLeft:'20px'}}>혈액형: </b>
            <select onChange={(e)=>{
                setBlood(e.target.value);
            }}>
                <option selected>A</option>
                <option>B</option>
                <option>AB</option>
                <option>O</option>
            </select>

            <b style={{marginLeft:'10px'}}>이미지 </b>
            <select onChange={(e)=>{
                setPhoto(e.target.value);
            }}>
            {/*{
                //1~10까지 map으로 돌리기
                //[...new Array(10)].map((a,idx)=>(<option>{`${idx+1}`}</option>))
            }*/}
            <option>01</option>
            <option>02</option>
            <option>03</option>
            <option>04</option>
            <option>05</option>
            <option>06</option>
            <option>07</option>
            <option>08</option>
            <option>09</option>
            <option>10</option>
            </select>
            <button type='button' className='btn btn-info btn-sm' style={{marginLeft:'10px'}}
            onClick={addDataEvent}>추가</button>
        </div>
    );
}

export default WriteForm;