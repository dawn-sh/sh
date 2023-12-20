import React, { useState } from 'react';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';

function Member(props) {


    const navi=useNavigate();

    const [data,setData]=useState({
        id:'',
        name:'',
        pass:'',
        email:'',
        hp:'',
        addr:'',
        emailok:false
    });

    const [passOk,setPassOk]=useState(false);
    const [email1,setEmail1]=useState('');
    const [email2,setEmail2]=useState('');
    const [btnOk,setBtnOk]=useState(false);


    //submit이 호출될 함수
    const onSave=(e)=>{
        e.preventDefault(); //기본이벤트 무효화 .. submit시 action이 호출 안되게
        console.dir(data); //onChange해줄때 data 어떻게 들어가나 console 확인


        //이메일 합치기
        setData({
            ...data,
            email:`${email1}@${email2}` //렌더링이 email2누를때 들어감

        })

        if(!btnOk)
        {
            alert("Please check ID valid");
            return;
        }
        if(!passOk)
        {
            alert("Please check pass valid");
            return;
        }

        //insert
        const url="http://localhost:9000/member/insert";
        axios.post(url,data)
        .then(rex=>{
            alert("insert성공!!");
            //이동
            navi("/login");
        })

        if(!data.emailok)
        {
            //null 값 체크
            alert("E-mail check please");
            return;
        }
    }

    


    //data 입력시 호출
    const onDataChange=(e)=>{
        
        //console 값확인
        const {name,value}=e.target;

        //이벤트 발생시 name이 pass일 경우 passOk 는 false
        if(name==='pass')
            setPassOk(false);

        //console에 찍어봄
        setData({
            ...data,
            [name]:value
        })
    }
    
    
    //console 값확인
    //이메일 select 변경시 호출
    const onEmailChange=(e)=>{
        const {value}=e.target;
        console.log(value);

        if(value==='-')
            setEmail2(''); //직접입력
        else
            setEmail2(value); //값 가져오기
    }

    //2번째 pass입력시 호출
    const onPassChange=(e)=>{
        const {value}=e.target;

        if(value===data.pass)
            setPassOk(true);
        else
            setPassOk(false);
    }


    //id 중복체크 확인
    const onIdValidCheck=()=>{

        const url="http://localhost:9000/member/idsearch?id="+data.id;

        axios.get(url)
        .then(res=>{

            console.log(res.data); // 0 or 1

            if(res.data===0)
            {
                setBtnOk(true);
                alert("You can use this ID");
            }
            else
            {
                setBtnOk(false);
                alert("You can't use this ID");
            }
        })
    }



    return (
        <div>
            <form onSubmit={onSave}>
                <table class="table table-stripped" style={{ width: '600px' }}>
                    <caption align="top"><b>회원가입</b></caption>
                    <tbody>

                        <tr >
                            <th width='100'>아이디</th>
                            <td className='d-inline-flex'>
                                <input type='text' className='form-control' style={{ width: '130px' }}
                                    name='id' required onChange={onDataChange}/>
                                <button type='button' className='btn btn-danger'
                                    style={{ marginLeft: '5px' }} onClick={onIdValidCheck}>중복체크</button>
                            </td>
                        </tr>

                        <tr>
                            <th width='100'>이름</th>
                            <td>
                                <input type='text' className='form-control' style={{ width: '130px' }}
                                    name='name' required onChange={onDataChange}/>
                            </td>
                        </tr>


                        <tr>
                            <th width='100'>비밀번호</th>
                            <td className='d-inline-flex'>
                                <input type='password' className='form-control' style={{ width: '130px' }}
                                    name='pass' required onChange={onDataChange}/>
                                <input type='password' className='form-control' style={{ width: '130px' }}
                                    required onChange={onPassChange}/>


                                <span style={{ marginLeft: '5px', color: 'red' }}>{passOk?'ok':'fail'}</span>
                            </td>
                        </tr>


                        <tr>
                            <th>이메일</th>
                            <td className='d-inline-flex'>
                                <input type='text' className='form-control' style={{ width: '100px' }} required
                                onChange={(e)=>{
                                    setEmail1(e.target.value);
                                }}/>
                                <b>@</b>
                                <input type='text' className='form-control' style={{ width: '130px' }} required
                                defaultValue={email2}
                                onChange={(e)=>{
                                    setEmail2(e.target.value);
                                }}/>
                                &nbsp;&nbsp;
                                <select className='form-control' onChange={onEmailChange}>
                                    <option value='-'>직접입력</option>
                                    <option value='naver.com'>네이버</option>
                                    <option value='gmail.com'>구글</option>
                                    <option value='daum.net'>한메일</option>
                                </select>
                                <button type='button' className='btn btn-danger'
                                onClick={()=>{
                                    setData({
                                        ...data,
                                        email:`${email1}@${email2}`,
                                        emailok:true
                                    });
                                    alert("E-mail valid check complete");
                                }}>E-mail check</button>
                            </td>
                        </tr>


                        <tr>
                            <th width='100'>핸드폰</th>
                            <td>
                                <input type='text' className='form-control' style={{ width: '180px' }}
                                    name='hp' required onChange={onDataChange}/>
                            </td>
                        </tr>


                        <tr>
                            <th width='100'>주소</th>
                            <td>
                                <input type='text' className='form-control' style={{ width: '330px' }}
                                    name='addr' required onChange={onDataChange}/>
                            </td>
                        </tr>


                        <tr>
                            <td colSpan={2} style={{ textAlign: 'center' }}>
                                <button type='submit' className='btn btn-info'>가입하기</button>
                                <button type='button' className='btn btn-success' onClick={()=>{
                                    navi("/member/list");
                                }}>목록</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div>
    );
}

export default Member;