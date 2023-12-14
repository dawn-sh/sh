import React, { useState } from 'react';
import AcUnitIcon from '@mui/icons-material/AcUnit';
import IceSkatingIcon from '@mui/icons-material/IceSkating';
import Alert from '@mui/material/Alert';
import RowItemApp from './RowItemApp';
import WriteForm from './WriteForm';

function OneApp(props) {

    const [board,setBoard]=useState([
        
        {
            name:'유재석',
            photo:'01',
            blood:'A',
            today:new Date()
        },
        {
            name:'박명수',
            photo:'02',
            blood:'B',
            today:new Date()
        },
        {
            name:'노홍철',
            photo:'03',
            blood:'AB',
            today:new Date()
        },
        {
            name:'정형돈',
            photo:'04',
            blood:'O',
            today:new Date()
        }
    ])


    //데이터 추가 함수 이벤트
    //boart를 바꾸면 렌더링이 되면서 추가된다
    const datasave=(data)=>{
        //배열에 추가
        setBoard(board.concat({

            /*name:data.name,
            photo:data.photo,
            blood:data.blood,*/
            ...data,
            today:new Date()
        }))
    }

    const datadelete=(idx)=>{
        setBoard(board.filter((item,i)=>i!==idx))
    }



    return (
        <div>
            <Alert severity="info">OneApp_테이블만들기(부모자식간의 통신)<IceSkatingIcon/><AcUnitIcon/></Alert>

            <WriteForm onSave={datasave}/>

            <table className='table table-bordered' style={{width:'500px'}}>
                <caption align='top'><b>Board배열 출력</b></caption>
                <thead>
                    <tr className='table-success'>
                        <th width='100'>이름</th>
                        <th width='120'>사진</th>
                        <th width='80'>혈액형</th>
                        <th width='160'>날짜</th>
                        <th width='70'>삭제</th>
                    </tr>
                </thead>
                <tbody>
                    {
                        //데이터 갯수만큼 호출됨...출력은 RowItemApp 완성 이후...출력도 RowItemApp에서 한다
                                                                    //특정 지을 수 있는 index값이 필요하기 때문에 index값도 넘겨줘야 한다
                        board.map((row,index)=>(<RowItemApp row={row} idx={index} onDelete={datadelete}/>))
                    }
                </tbody>
            </table>
        </div>
    );
}

export default OneApp;