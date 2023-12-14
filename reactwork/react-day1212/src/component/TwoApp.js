import React, { useState } from 'react';

function TwoApp(props) {

    //객체처리변수
    //변수를 객체처리로 이렇게 담을 수도 있다
    const [inputs,setInputs] =useState({
        name:'강호동',
        addr:'서울시 강남구',
        age:20
    });

    //3개의 공통함수
    // input 태그에서 준 name='name'의 앞에 name을 가져왔기 때문에 각 input 창 모두 입력값 가능
    const changeData=(e)=>{
        console.log("name: "+e.target.value);
        console.log("value: "+e.target.value);

        //name.value값 얻기
        //e.target이 가지고 있는 객체 한번에 변경하기
        const {name,value}=e.target;

        //변경
        setInputs({

            ...inputs, //펼침연산자를 줌으로써 입력해도 다른 값들 유지할 수 있게 해준다
                        //기존의 멤버값 유지
            [name]:value //해당값만 나오고 나머지는 사라진다...해결은 펼침연산자
            
        })
    }


    return (
        <div>
            <h3 className='alert alert-warning'>TwoApp입니다_state 를 객체변수로 받아서 테스트</h3>
                                                    {/* 위에 쓴 useState에서 변수로 담은 값을 이렇게 가져올 수 있다 */}
            <h3>이름: <input type='text' name='name' defaultValue={inputs.name}
            onChange={changeData}/></h3>
            <h3>주소: <input type='text' name='addr' defaultValue={inputs.addr}
            onChange={changeData}/></h3>
            <h3>나이: <input type='text' name='age' defaultValue={inputs.age}
            onChange={changeData}/></h3>

            <hr/>
            <h2>이름: {inputs.name},{inputs['name']}</h2>
            <h2>주소: {inputs.addr},{inputs['addr']}</h2>
            <h2>이름: {inputs.age},{inputs['age']}</h2>
        </div>
    );
}

export default TwoApp;