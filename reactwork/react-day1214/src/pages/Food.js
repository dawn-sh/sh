import React from 'react';
import { useNavigate, useParams } from 'react-router-dom';

function Food(props) {

    const {food1,food2}=useParams();
    const navi=useNavigate();
    return (
        <div>
            <h3>오늘 식사 메뉴</h3>
            <button type='button' className='btn btn-info'
            onClick={()=>{
                navi(-1); //-1이 이전 페이지
            }}>이전페이지</button>
            {/* 상대경로로 파라메터값 두개 보내기 위해서 ../../로 경로 설정 */}
            <img src={`../../image/${food1}.jpg`} className='img-thumbnail'
            style={{width:'200px',height:'200px'}}/>
            <img src={`../../image/${food2}.jpg`} className='img-thumbnail'
            style={{width:'200px',height:'200px'}}/>
        </div>
    );
}

export default Food;