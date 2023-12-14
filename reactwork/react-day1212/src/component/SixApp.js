import React, { useState } from 'react';
import SixSubApp from './SixSubApp';
import SixSubApp2 from './SixSubApp2';
import SixSubApp3 from './SixSubApp3';

//props라는 변수로 <SixSubApp name="진평" age="23"/>(SixSubApp)에 name과 age 전달 가능
function SixApp(props) {

    //자식 파일에서는 값 변경 불가
    //자식이 값 변경할 수 있게 부모에서 이벤트로 넘겨야한다
    const [number,setNumber]=useState(10);

    //증가
    const numberIncre=()=>{
        setNumber(number+1);
    }

    //감소
    const numberDecre=()=>{
        setNumber(number-1);
    }


    // 자식은 부모한테만 import 후 app.js에서는 부모만 import 되어있어야한다

    return (
        <div>
            <h3 className='alert alert-danger'>SixApp입니다_부모자식간 컴포넌트통신</h3>
                {/* 자식 연속적인 호출 가능 */}
                <SixSubApp name="진평" age="23"/>
                <SixSubApp name="형준" age="20"/>
                <SixSubApp name="성신" age="22"/>
                <br/><br/>
                {/* props가 아닌 명확한 변수로 보내기 */}
                <SixSubApp2 flower="수국" price="25000" linecolor="purple"/>
                <SixSubApp2 flower="핑크장미" price="35000" linecolor="pink"/>
                <SixSubApp2 flower="프리지아" price="15000" linecolor="yellow"/>
                <br/><br/>
                <div className='number'>{number}</div>

                {/* 부모에서 만든 증가 함수와 감소 함수를 incre/decre에 넣어서 자식에게 넘긴다 */}
                <SixSubApp3 incre={numberIncre} decre={numberDecre}/>
        </div>
    );
}

export default SixApp;