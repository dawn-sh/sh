import logo from './logo.svg';
import './App.css';

function App() {
  return (
    // 1개의 태그만 return 가능 그래서 div 1개 안에 넣을거 다 넣어야함
    /* <br></br>이 생기기 때문에 <br/>로 닫아줘야함 */
    // class가 className으로 쓰인다
    <div className="App">
      <h3 className='alert alert-info'>리액트 시작!!</h3>
    </div>
  );
}

export default App;
