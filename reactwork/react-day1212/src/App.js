import logo from './logo.svg';
import './App.css';
import { useState } from 'react';
import OneApp from './component/OneApp';
import TwoApp from './component/TwoApp';
import ThreeApp from './component/ThreeApp';
import FourApp from './component/FourApp';
import FiveApp from './component/FiveApp';
import SixApp from './component/SixApp';
import SevenApp from './component/SevenApp';

function App() {

  const [idx,setIdx]=useState(6);

  const selectComp=(e)=>{

    setIdx(Number(e.target.value)); 
  }

  return (
    <div className="App">
      <div style={{fontSize:'20px'}}>
          {/* 같은 radio버튼 name 동일하게 줄 것 */}
        <label>
          <input type='radio' name='Comp' defaultChecked defaultValue='1' onClick={selectComp}/>OneApp
        </label> &nbsp;
        <label>
          <input type='radio' name='Comp' defaultValue='2' onClick={selectComp}/>TwoApp
        </label> &nbsp;
        <label>
          <input type='radio' name='Comp' defaultValue='3' onClick={selectComp}/>ThreeApp
        </label> &nbsp;
        <label>
          <input type='radio' name='Comp' defaultValue='4' onClick={selectComp}/>FourApp
        </label> &nbsp;
        <label>
          <input type='radio' name='Comp' defaultValue='5' onClick={selectComp}/>FiveApp
        </label> &nbsp;
        <label>
          <input type='radio' name='Comp' defaultValue='6' onClick={selectComp}/>SixApp
        </label> &nbsp;
        <label>
          <input type='radio' name='Comp' defaultValue='7' onClick={selectComp}/>SevenApp
        </label> &nbsp;

        {idx===1?<OneApp/>:idx===2?<TwoApp/>:idx===3?<ThreeApp/>:idx===4?<FourApp/>:idx===5?<FiveApp/>:idx===6?<SixApp/>:<SevenApp/>}
      </div>
    </div>
  );
}

export default App;
