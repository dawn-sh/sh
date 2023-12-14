import React from 'react';

function TwoSubApp(props) {
    return (
        <div style={{marginLeft:'100px'}}>
            <b>메세지</b>
            <input type='text' className='form-control'
            style={{width:'400px'}}
            onChange={(e)=>{
                props.onMessage(e.target.value);
                }}/>
            <br/>
            <b>글자색변경</b>
            <input type='color' defaultValue='#ffc' className='form-control' style={{width:'400px'}}
            onChange={(e)=>{
                props.onColor(e.target.value);
            }}/>
            <br/>
            <b>이미지변경</b>
            <select onChange={props.photo}>
                <option>01</option>
                <option>02</option>
                <option>03</option>
                <option>04</option>
                <option>05</option>
                <option>06</option>
                <option>07</option>
                <option>08</option>
                <option>09</option>
                <option>10</option>
                {/*{
                    [...new Array(10).map((a,idx)=>(<option>{idx+1}</option>))]
                }*/}
            </select>
        </div>
    );
}

export default TwoSubApp;