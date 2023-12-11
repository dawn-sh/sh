import logo from './logo.svg';
import './App.css';
import { useState } from 'react';
import OneApp from './components/OneApp';
import TwoApp from './components/TwoApp';
import ThreeApp from './components/ThreeApp';
import FourApp from './components/FourApp';
import FiveApp from './components/FiveApp';
import SixApp from './components/SixApp';
import SevenApp from './components/SevenApp';

function App() {

// index.js에 따로 추가 안하고 select로 js파일 import 받아오는 법

  const [index,setIndex] = useState(1); //기본값으로 1를 줬기 때문에 처음 설정하면 OneApp먼저 나옴

  return (
    <div className="App">
      <b style={{marginLeft:'100px',fontSize:'20px'}}>컴포넌트 선택하기: </b>
      
      <select onChange={(e)=>{
        setIndex(Number(e.target.value));
      }}>
        <option value='1' selected>OneApp확인하기</option>
        <option value='2'>TwoApp확인하기</option>
        <option value='3'>ThreeApp확인하기</option>
        <option value='4'>FourApp확인하기</option>
        <option value='5'>FiveApp확인하기</option>
        <option value='6'>SixApp확인하기</option>
        <option value='7'>SevenApp확인하기</option>
      </select>

      {index===1?<OneApp/>:index===2?<TwoApp/>:index===3?<ThreeApp/>:index===4?<FourApp/>:index===5?<FiveApp/>:index===6?<SixApp/>:<SevenApp/>}


    </div>
  );
}

export default App;
