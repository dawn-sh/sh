import React from 'react';
import { useNavigate } from 'react-router-dom';

function ShopRowItem({idx,row}) {

    let photoUrl="http://localhost:9000/save/";

    const navi=useNavigate();

    return (
        <tr>
            <td>{idx+1}</td>
            <td><b>{row.sangpum}<img src={photoUrl+row.photo} className='small'/></b></td>
            <td>
                <button type='button' className='btn btn-outline-info'
                onClick={()=>{
                    //navi("/shop/detail/"+row.num);
                    navi(`/shop/detail/${row.num}`); //num은 RouteMain에서 넘겨준 num
                }}>상세보기</button>
            </td>
        </tr>
    );
}

export default ShopRowItem;