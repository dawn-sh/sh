import React from 'react';
import './Mystyle.css';
// import '같은 파일경로라면 ./Mystyle.css'
import img1 from '../image/4.jpeg';
import img2 from '../image/6.jpeg';
// 이미지는 import 변수 from '경로'로 받아 줘야한다

// 자동완성 단축키 선생님 카페에 정리 되어 있음
function FirstApp(props) {

    //스타일을 변수에 지정
    const styleTmg1={
        width:'200px',
        border:'5px solid green',
        marginTop:'20px'
    }


    return (
        <div>
            {/* App.css에서 style주면 className따라서 적용 가능
                다른 css 파일에 style 만들면 위에처럼 import 받아야한다*/}
            <h2 className='line2'>FirstApp Component!!!</h2>
            {/* style 줄때 {{}} 이렇게 주고 해야한다 */}
            <div style={{fontSize:'25px',marginLeft:'100px',backgroundColor:'lightgray'}}>
                안녕~~ 오늘은 목요일이야!!
            </div>
            {/* import 받아온 이미지 넣으려면 {}안에 넣어줘야함 */}
            {/* 스타일을 위에 변수에 지정한 것을 적용하려면 {}안에 해줘야함 */}
            {/* src의 이미지는 import */}
            <img src={img1} style={styleTmg1}/>
            <img src={img2} style={{width:'200px', border:'3px dotted pink',marginLeft:'50px'}}/>

            {/* public image는 직접 호출 가능 */}
            <h3>public image</h3>
            <img src='../image2/12.jpeg'/>
            <img src='../image2/20.jpeg'/>
        </div>
    );
}

export default FirstApp;