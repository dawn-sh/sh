import React from 'react';
import { Info, Title, Menu, Main, About } from './components';
import { Routes, Route } from 'react-router-dom';
import Shop from './shop/Shop';
import Board from './board/Board';
import Member from './member/Member';
import Login from './login/Login';
import { ShopDetail, ShopForm } from './shop';

function RouteMain(props) {
    return (
        <div>
            <div className='title'><Title/></div>
            <div className='info'><Info/></div>
            <div className='menu'><Menu/></div>
            <div className='main'>
                <Routes>
                    <Route path='/' element={<Main/>}/>



                    {/* shop */}
                    <Route path='/shop/list' element={<Shop/>}/>
                    <Route path='/shop/form' element={<ShopForm/>}/>
                    {/* :num은 num값을 넘기는 것
                        backend에서 먼저 num값 넘겨주는 것 처리해줘야함 */}
                    <Route path='/shop/detail/:num' element={<ShopDetail/>}/>




                    <Route path='/board/list' element={<Board/>}/>
                    <Route path='/member/form' element={<Member/>}/>
                    <Route path='/login' element={<Login/>}/>
                    <Route path='/about' element={<About/>}/>
                    <Route path='*' element={
                        <div>
                            <h1>잘못된 주소입니다</h1>
                        </div>
                    }/>
                    
                </Routes>
            </div>
        </div>
    );
}

export default RouteMain;