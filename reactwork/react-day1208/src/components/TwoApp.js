import React, { useState } from 'react';

function OneApp(props) {


    const [photo,setPhoto] = useState('../image2/15.jpeg');

    const changePhoto=(e)=>{

        setPhoto(e.target.value);
    }


    return (
        <div>
            <h3 className='alert alert-info'>TwoApp입니다_Radio버튼</h3>
            <div>
                <b>이미지선택: </b><br/>
                <label>
                    <input type='radio' name='photo' value='../image2/12.jpeg' onClick={changePhoto}/>이미지1
                </label>
                &nbsp;&nbsp;
                <label>
                    <input type='radio' name='photo' value='../image2/15.jpeg' onClick={changePhoto}
                    defaultChecked/>이미지2
                </label>
                &nbsp;&nbsp;
                <label>
                    <input type='radio' name='photo' value='../image2/16.jpeg' onClick={changePhoto}/>이미지3
                </label>
                &nbsp;&nbsp;
                <label>
                    <input type='radio' name='photo' value='../image2/20.jpeg' onClick={changePhoto}/>이미지4
                </label>
                &nbsp;&nbsp;
                <label>
                    <input type='radio' name='photo' value='../image2/24.jpeg' onClick={changePhoto}/>이미지5
                </label>
                &nbsp;&nbsp;
            </div>

            <img src={photo}/>
        </div>
    );
}

export default OneApp;