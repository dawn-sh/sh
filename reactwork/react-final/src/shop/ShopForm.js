import React, { useState } from 'react';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';

function ShopForm(props) {


    //변수
    //db와 이름 똑같이 해줘야한다...photo는 달라도 상관 없음
    const [photo,setPhoto]=useState('');
    const [sangpum,setSangpum]=useState('');
    const [su,setSu]=useState('');
    const [dan,setDan]=useState('');

    //상품등록 후 상품목록으로 이동
    const navi=useNavigate();//insert 후 목록으로 이동

    //url등록
    //upload에는 mapping주소와 가상폴더 url이 필요(2개)
    let uploadUrl="http://localhost:9000/shop/upload";//백엔드 매핑주소
    let photoUrl="http://localhost:9000/save/";
    //상품등록 후 상품목록으로 이동 Url
    let insertUrl="http://localhost:9000/shop/insert";

    //file change시 호출이벤트
    const uploadImage=(e)=>{

        //한번은 등록해줘야함
        //언제나 file의 0번지
        const uploadFile=e.target.files[0];
        const imageFile=new FormData();
            imageFile.append("uploadFile",uploadFile); //String 형식으로 value값 넣어줌...spring controller에서 정해준 변수와 똑같이
        
        axios({
            method: 'post',
            url: uploadUrl,
            data: imageFile, //생성한 imageFile
            headers:{'Content-Type':'multipart/form-data'} //원래는 폼에서 해주던 것을 여기서 해준다
        }).then(res=>{ //성공하면
            setPhoto(res.data); //백엔드에서 보낸 변경된 이미지명을 photo변수에 넣는다
        }).catch(err=>{//에러났을때
            alert(err);
        })
    }

    //input(onChange={uploadImage})과 밑에 src={photoUrl+photo}를 주고 spring 실행 시키면 연결 완료
    //axios가 defined가 안된다는 에러가 뜬다면 위에 따로 import 받아주면 된다

    //insert 추가하는 함수 이벤트...추가 후 이동
    const onInsert=()=>{

        axios.post(insertUrl,{sangpum,su,dan}) //data값에 key(spring 이름)와 value값이 같으면 1개만 작성해도 괜찮다
        .then(res=>{
            //insert처리 후 코드들....
            //목록으로 이동(초기화 생략)
            navi("/shop/list");
        })
    }

    return (
        <div style={{marginLeft:'100px'}}>
            <table className='table table-bordered' style={{width:'600px'}}>
                <caption align='top'><b>상품등록</b></caption>
                <tbody>
                    <tr>
                        <th>상품명</th>
                        <td>
                            <input type='text' className='form-control' style={{width:'250px'}}
                            onChange={(e)=>{
                                setSangpum(e.target.value);
                            }}/>
                        </td>
                        <th>{sangpum}</th>
                    </tr>
                    <tr>
                        <th>상품사진</th>
                        <td>
                            {/* 사진 나오게 하려면 spring에서 전송되야지만 나온다 */}
                            <input type='file' className='form-control' style={{width:'250px'}}
                            onChange={uploadImage}/>
                        </td>
                        <th></th>
                    </tr>
                    <tr>
                        <th>수량</th>
                        <td>
                            <input type='text' className='form-control' style={{width:'250px'}}
                            onChange={(e)=>{
                                setSu(e.target.value);
                            }}/>
                        </td>
                        <th>{su}</th>
                    </tr>
                    <tr>
                        <th>단가</th>
                        <td>
                            <input type='text' className='form-control' style={{width:'250px'}}
                            onChange={(e)=>{
                                setDan(e.target.value);
                            }}/>
                        </td>
                        <th>{dan}</th>
                    </tr>
                    <tr>
                        <td colSpan='2'>
                            {/* url+사진을 넣어줘야함 */}
                            <img src={photoUrl+photo} style={{width:'120px',marginLeft:'130px'}}/>
                        </td>
                        <td>
                            <button type='button' className='btn btn-info' 
                            style={{width:'100px',height:'100px',marginLeft:'30px',marginTop:'10px'}}
                            onClick={onInsert}>상품등록</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    );
}

export default ShopForm;