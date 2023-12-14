import React from 'react';
import Menu from './component/Menu';
import { Route, Routes } from 'react-router-dom';
import { About, Food, Home } from './pages';
// index.js에서 export를 받아놓으면 RouterMain에서 import 1줄 안에 여러개 겹쳐서 받을 수 있음
import mainimg from './image2/20.jpeg';


function RouterMain(props) {
    return (
        <div>
            {/* 실제 우리의 경로를 지정해주는 곳 
                모든페이지에서 공통으로 포함되는 컴포넌트나 이미지*/}
            <h1 className='alert alert-info'>React Router 공부하기</h1>
            <Menu />
            {/* public에 있는 사진이라 다른 이미지 추가하고 새로고침하면 이 사진 사라짐
                안사라지게 하기 위해서는 src 폴더에 이미지 넣어줘야함
                
                src에 넣고 변수로 Import로 변수 받아오면 여러 사진 가능*/}
            <img src={mainimg} className='main_photo' />
            <hr className='line' />

            <div className='main_comp'>
                {/* Routes안에서 계속 바뀌게 해주는 것 */}
                <Routes>
                    {/* 루트를 뭘로 시작할 것이냐 */}
                    <Route path='/' element={<Home />} />
                    <Route path='/about' element={<About />} />
                    {/* name을 파라메터로 넘기겠다는 것 */}
                    <Route path='/about/:name' element={<About/>}/>
                    <Route path='/login/*' element={
                        <div>
                            <h1>아직 로그인 기능 구현 전입니다</h1>
                            <img src='../image/12.jpg'/>
                            <h3>오늘 점심 이거 어때?</h3>
                        </div>
                    }/>

                    {/* 그 이외 매핑이면... */}
                    <Route path='*' element={
                        <h1>잘못된 주소입니다</h1>
                    }/>
                    <Route path='/food/:food1/:food2' element={<Food/>}/>
                </Routes>
            </div>
        </div>
    );
}

export default RouterMain;