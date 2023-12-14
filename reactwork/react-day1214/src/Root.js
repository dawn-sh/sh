import React from 'react';
// react-router-dom에서 BrowserRouter로 받아와주면된다
import {BrowserRouter} from 'react-router-dom';
import RouterMain from './RouterMain';

function Root(props) {
    return (
        <BrowserRouter>
            {/* 모든 경로가 오는 RouterMain을 이곳에 해줌 */}
            <RouterMain/>
        </BrowserRouter>
    );
}

export default Root;