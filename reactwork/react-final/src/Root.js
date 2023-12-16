import React from 'react';
import {BrowserRouter} from 'react-router-dom';
import RouteMain from './RouteMain';

function Root(props) {
    return (
        // npm install react-router-dom로 받은 BrowserRouter로 태그 바꿔줘야함
        // 실질적인 경로 설정
        <BrowserRouter>
            <RouteMain/>
        </BrowserRouter>
    );
}

export default Root;