import React from 'react';

function RowItemApp(props) {

    //props가 받아온 값이기 때문에 let 자료형 변수에 넣어주고 받아오면 된다
    let {row,idx,onDelete}=props;

    //삭제이벤트
    const btnDelete=()=>{
        onDelete(idx); //부모가 props로 보낸 이벤트 호출
    }

    return (
        <tr>
            <td>{row.name}</td>
            <td><img src={`../image2/${row.photo}.png`} style={{width:'60px',border:'1px solid gray',height:'80px'}}/></td>
            <td>{row.blood}형</td>
            {/* 날짜 그대로 가져오면 에러나기 때문에 '.toLocaleDateString('ko-kr')'를 넣어줘서 한국 날짜로 맞춰준다 */}
            <td>{row.today.toLocaleDateString('ko-kr')}</td>
            <td>
                <button type='button' className='btn btn-danger btn-sm' onClick={btnDelete}>삭제</button>
            </td>
        </tr>
    );
}

export default RowItemApp;