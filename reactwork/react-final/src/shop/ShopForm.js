import React from 'react';

function ShopForm(props) {
    return (
        <div style={{marginLeft:'100px'}}>
            <table className='table table-bordered' style={{width:'600px'}}>
                <caption align='top'><b>상품등록</b></caption>
                <tbody>
                    <tr>
                        <th>상품명</th>
                        <td>
                            <input type='text' className='form-control' style={{width:'250px'}}/>
                        </td>
                        <th></th>
                    </tr>
                    <tr>
                        <th>상품사진</th>
                        <td>
                            {/* 사진 나오게 하려면 spring에서 전송되야지만 나온다 */}
                            <input type='file' className='form-control' style={{width:'250px'}}/>
                        </td>
                        <th></th>
                    </tr>
                    <tr>
                        <th>수량</th>
                        <td>
                            <input type='text' className='form-control' style={{width:'250px'}}/>
                        </td>
                        <th></th>
                    </tr>
                    <tr>
                        <th>단가</th>
                        <td>
                            <input type='text' className='form-control' style={{width:'250px'}}/>
                        </td>
                        <th></th>
                    </tr>
                    <tr>
                        <td colSpan='2'>
                            <img src='../logo192.png' style={{width:'120px',marginLeft:'130px'}}/>
                        </td>
                        <td>
                            <button type='button' className='btn btn-info' 
                            style={{width:'100px',height:'100px',marginLeft:'30px',marginTop:'10px'}}>상품등록</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    );
}

export default ShopForm;