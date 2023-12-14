import logo from './logo.svg';
import './App.css';
import { useState } from 'react';
import OneApp from './component/OneApp';
import TwoApp from './component/TwoApp';

function App() {

  const [idx,setIdx]=useState('2');

  const selectComponent=(e)=>{
    setIdx(e.target.value);
  }



  return (
    <div className="App">
      <div style={{fontSize:'20px'}}>
        <label>
          <input type='radio' name='compo' defaultValue='1' defaultChecked
          onClick={selectComponent}/>OneApp
        </label>&nbsp;
        <label>
          <input type='radio' name='compo' defaultValue='2'
          onClick={selectComponent}/>TwoApp
        </label>&nbsp;
      </div>
      <hr/>
      {idx==='1'?<OneApp/>:<TwoApp/>}

    </div>
  );
}

export default App;
