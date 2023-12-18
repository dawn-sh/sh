import axios from 'axios';
import React, { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';

function ShopDetail(props) {

    //넘겨준 num값을 읽어야한다
    const {num}=useParams();

    //dto가 들어올 변수 선언
    const [data,setData]=useState('');

    //image 출력용 url / detail url
    let detailUrl="http://localhost:9000/shop/detail?num="+num;
    let photoUrl="http://localhost:9000/save/";

    //spring으로부터 num에 해당하는 data 받기
    const onDataReceive=()=>{

        axios.get(detailUrl)
        .then(res=>{

            console.log(res.data.sangpum); //sangpum값만 가져와서 확인
            //spring에서 넘긴 data를 여기서 변경해줌
            setData(res.data);
        }).catch(err=>{
            alert(err.data);
        })
    }

    //처음 렌더링시 위의 함수 호출
    useEffect(()=>{
        onDataReceive();
    },[]);

    return (
        <div>
            {/* num 출력확인시 db에서 가져올 수 있음 */}
            <h1>{num}</h1>
        </div>
    );
}

export default ShopDetail;