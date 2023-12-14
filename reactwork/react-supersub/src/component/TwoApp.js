import React, { useState } from 'react';
import Alert from '@mui/material/Alert';
import AddToQueueIcon from '@mui/icons-material/AddToQueue';
import BatterySaverIcon from '@mui/icons-material/BatterySaver';
import TwoSubApp from './TwoSubApp';

function TwoApp(props) {

    const [color,setColor]=useState("cadetblue");
    const [message,setMessage]=useState("오늘은 수요일*^^*");
    const [photo,setPhoto]=useState("05");

    //3개의 이벤트를 만들어 전달
    const changeMsg=(msg)=>{
        
        setMessage(msg);
    }

    const changeColor=(col)=>{

        setColor(col);
    }

    const changePhoto=(e)=>{
        setPhoto(e.target.value);
    }

    return (
        <div>
            <Alert severity="warning">TwoApp<AddToQueueIcon/><BatterySaverIcon/></Alert>
            <br/>
            <h1 style={{color:color}}>{message}</h1>
            <img src={`../image2/${photo}.png`}/>
            <br/>
            <TwoSubApp photo={changePhoto} onMessage={changeMsg} onColor={changeColor}/>
        </div>
    );
}

export default TwoApp;