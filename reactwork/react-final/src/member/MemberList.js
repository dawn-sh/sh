import axios from 'axios';
import React, { useEffect, useState } from 'react';

function MemberList(props) {


    const [memberList, setMemberList] = useState([]);

    const list = () => {


        const url = "http://localhost:9000/member/list";

        axios.get(url)
        .then(res => {
            setMemberList(res.data);
        })
    }

    useEffect(()=>{
        list();
    },[])

    const onDelete=(num)=>{

        const deleteUrl = `http://localhost:9000/member/delete?num=${num}`;

        axios.delete(deleteUrl)
        .then(res=>{
            alert("DELETE COMPLETE");
            list();
        })
    }

    return (
        <div>
            <table className='table table-stripped' style={{width:'900px',marginLeft:'100px'}}>
                <thead style={{textAlign:'center',verticalAlign:'middle'}}>
                    <th>번호</th>
                    <th>이름</th>
                    <th>아이디</th>
                    <th>휴대폰번호</th>
                    <th>주소</th>
                    <th>이메일</th>
                    <th>가입일</th>
                    <th>삭제</th>
                </thead>
                <tbody style={{textAlign:'center',verticalAlign:'middle'}}>
                    {
                        memberList.map((member,index)=>(
                            <tr key={index}>
                                <td>{index+1}</td>
                                <td>{member.name}</td>
                                <td>{member.id}</td>
                                <td>{member.hp}</td>
                                <td>{member.addr}</td>
                                <td>{member.email}</td>
                                <td>{member.gaipday}</td>
                                <td>
                                <button type='button' className='btn btn-outline-danger btn-sm' onClick={() => onDelete(member.num)}>DELETE</button>
                                </td>
                            </tr>
                        ))
                    }
                </tbody>
            </table>
        </div>
    );
}

export default MemberList;