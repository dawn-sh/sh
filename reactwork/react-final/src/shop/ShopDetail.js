import axios from 'axios';
import React, { useEffect, useState } from 'react';
import { useNavigate, useParams } from 'react-router-dom';
import Button from '@mui/material/Button';
import Dialog from '@mui/material/Dialog';
import DialogActions from '@mui/material/DialogActions';
import DialogContent from '@mui/material/DialogContent';
import DialogContentText from '@mui/material/DialogContentText';
import DialogTitle from '@mui/material/DialogTitle';
import Slide from '@mui/material/Slide';
import { TransitionProps } from '@mui/material/transitions';


const Transition = React.forwardRef(function Transition(
    props: TransitionProps & {
        children: React.ReactElement<any, any>;
    },
    ref: React.Ref<unknown>,
) {
    return <Slide direction="up" ref={ref} {...props} />;
});



function ShopDetail(props) {

    //넘겨준 num값을 읽어야한다
    const { num } = useParams();

    //dto가 들어올 변수 선언
    const [data, setData] = useState('');

    //image 출력용 url / detail url
    let detailUrl = "http://localhost:9000/shop/detail?num=" + num;
    let photoUrl = "http://localhost:9000/save/";
    let deleteUrl = "http://localhost:9000/shop/delete?num=" + num;

    //spring으로부터 num에 해당하는 data 받기
    const onDataReceive = () => {

        axios.get(detailUrl)
            .then(res => {

                console.log(res.data.sangpum); //sangpum값만 가져와서 확인
                //spring에서 넘긴 data를 여기서 변경해줌
                setData(res.data);
            }).catch(err => {
                alert(err.data);
            })
    }

    //처음 렌더링시 위의 함수 호출
    useEffect(() => {
        onDataReceive();
    }, []);

    const navi = useNavigate();





    //삭제 다이얼로그 코드추가(mui)
    const [open, setOpen] = React.useState(false);

    const handleClickOpen = () => {
        setOpen(true);
    };

    const handleClose = () => {
        setOpen(false);
    };

    //삭제시 호출될 함수
    const onDelete=()=>{

        console.log("delete");

        axios.delete(deleteUrl)
        .then(res=>{
            //삭제 후 목록 이동
            navi("/shop/list");
        })

        handleClose();
    }






    return (
        <div>
            {/* num 출력확인시 db에서 가져올 수 있음 */}
            {/*<h1>{num}</h1>*/}
            <table className='table table-bordered' style={{ width: '700px', marginLeft: '100px' }}>
                <caption align='top'><b>상품상세보기</b></caption>
                <tbody>
                    <tr style={{ height: '150px' }}>
                        <td width='350' rowSpan='4'>
                            <img src={photoUrl + data.photo} className='large' />
                        </td>
                        <td>
                            <h4>상품명: {data.sangpum}</h4>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h4>수량: {data.su}</h4>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h4>단가: {data.dan}</h4>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h4>입고일: {data.ipgoday}</h4>
                        </td>
                    </tr>
                    <tr>
                        <td colSpan='2' align='center'>
                            <button type='button' className='btn btn-outline-success'
                                onClick={() => {
                                    navi('/shop/list');
                                }}>목록</button>
                            <button type='button' className='btn btn-outline-info'
                                onClick={() => {
                                    navi('/shop/form');
                                }}>추가</button>
                            <button type='button' className='btn btn-outline-warning'>수정</button>
                            <button type='button' className='btn btn-outline-danger' onClick={handleClickOpen}>삭제</button>
                        </td>
                    </tr>
                </tbody>
            </table>


            <Dialog
                open={open}
                TransitionComponent={Transition}
                keepMounted
                onClose={handleClose}
                aria-describedby="alert-dialog-slide-description"
            >
                <DialogTitle>
                    <h4>Do you want to delete it?</h4>
                </DialogTitle>
                <DialogContent>
                    <DialogContentText id="alert-dialog-slide-description">
                        <h5>If you want to delete it, click the [Delete] please</h5>
                    </DialogContentText>
                </DialogContent>
                <DialogActions>
                    <Button onClick={handleClose}>Cancel</Button>
                    <Button onClick={onDelete}>Delete</Button>
                </DialogActions>
            </Dialog>




        </div>
    );
}

export default ShopDetail;