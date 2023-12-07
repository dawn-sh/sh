import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import App from './App';
import reportWebVitals from './reportWebVitals';
import FirstApp from './components/FirstApp';
import SecondApp from './components/SecondApp';
import ThirdApp from './components/ThirdApp';
import FourthApp from './components/FourthApp';
import FifthApp from './components/FifthApp';

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    {/* 아래 <App /> 1개만 있을때 주석처리하면 흰 화면이 뜸 */}
    {/* <App /> */}
    {/* components폴더에 만든 FirstApp.js 화면에 띄워주기 */}
    {/* <FirstApp/> */}
    {/* <SecondApp/> */}
    {/* <ThirdApp/> */}
    {/* <FourthApp/> */}
    <FifthApp/>
  </React.StrictMode>
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
