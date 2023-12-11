import React, { useState } from 'react';
import Alert from '@mui/material/Alert';
import AdsClickIcon from '@mui/icons-material/AdsClick';

function OneApp(props) {

    const [names,setNames]=useState(['진평','현규','영환','민규','성신']);
    const [irum,setIrum]=useState('') //추가시 새로운 변수가 있어야한다

    //추가버튼 이벤트
    const btnInsert=()=>{
        setNames(names.concat(irum)); //배열데이터에 입력한 이름을 추가
        setIrum(''); //실행시 입력한 창 초기화
    }

    //Enter이벤트
    const txtEnter=(e)=>{

        if(e.key==='Enter')
        {
            //btnInsert안에 값들을 가져옴
            btnInsert();
        }
    }

    //input창에 value값을 주는 순간 입력이 안되기 때문에 입력 되도록 이벤트 주기
    const txtInput=(e)=>{
        setIrum(e.target.value);
    }

    //클릭시 삭제
    //index가 클릭한 이름
    const dataRemove=(index)=>{
        
        console.log("remove: "+index);

        //방법1...slice
        /*setNames([
            ...names.slice(0,index),
            ...names.slice(index+1,names.length)
        ]);*/ //index번지만 빼고 잘라서 다시 넣음

        //방법2...filter
        //랜더링...화면상에 변경(set)을 해준다 -> filter를 받을건데 선택한 index를 제외하고 다시 랜더링(복사)받는다
        //i값은 기존에 넘겨주는 index와 겹치기 때문에 다른 변수로 주어준 것
        setNames(names.filter((item,i)=>i!==index)) //선택한 인덱스만 지워줌

    }

    return (
        <div>
            <h3 className='alert alert-info'>SixApp입니다</h3>
            <Alert severity="success">배열연습_#6<AdsClickIcon/></Alert>

            {/* Enter이벤트/추가버튼 이벤트 둘 중 아무거나 해도 추가되도록 이벤트 주어줌 */}
            <input value={irum} onChange={txtInput} placeholder='이름입력'
            onKeyUp={txtEnter}/>
            <button type='button' className='btn btn-info' style={{marginLeft:'10px'}}
            onClick={btnInsert}>추가</button>
            <br/>

            {/* 이유는 모르지만 onClick을 onDoubleClick으로 하기만 하면  */}
            <h4>이름을 클릭하면 삭제됩니다 </h4>
            <ul>
                {
                    names.map((name,index)=>(<li className='data'
                    onClick={()=>dataRemove(index)}>{name}</li>))
                }
            </ul>
        </div>
    );
}

export default OneApp;