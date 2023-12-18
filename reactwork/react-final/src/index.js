import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import App from './App';
import reportWebVitals from './reportWebVitals';
import Root from './Root';

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  // 클래스때문에 있던거지만 지금은 shop list 호출시 2번 호출되기 때문에 지워주면 1번만 호출되는 것을 확인 가능
  // <React.StrictMode>
    /* Root로 layout 설정 */
    <Root/>
  // </React.StrictMode>
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
