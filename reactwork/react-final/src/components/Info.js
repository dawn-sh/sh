import React from 'react';
import infoimg from '../image/24.jpeg'

function Info(props) {
    return (
        <div>
            <img src={infoimg} style={{width:'150px'}}/>
            <br/><br/>
            <div>냥뇽녕냥</div>
            <div>02-555-111</div>
        </div>
    );
}

export default Info;