import React, { useState } from 'react';
import { styled } from '@mui/material/styles';
import Card from '@mui/material/Card';
import CardHeader from '@mui/material/CardHeader';
import CardMedia from '@mui/material/CardMedia';
import CardContent from '@mui/material/CardContent';
import CardActions from '@mui/material/CardActions';
import Collapse from '@mui/material/Collapse';
import Avatar from '@mui/material/Avatar';
import IconButton, { IconButtonProps } from '@mui/material/IconButton';
import Typography from '@mui/material/Typography';
import { red } from '@mui/material/colors';
import FavoriteIcon from '@mui/icons-material/Favorite';
import ShareIcon from '@mui/icons-material/Share';
import ExpandMoreIcon from '@mui/icons-material/ExpandMore';
import MoreVertIcon from '@mui/icons-material/MoreVert';

interface ExpandMoreProps extends IconButtonProps {
    expand: boolean;
}

const ExpandMore = styled((props: ExpandMoreProps) => {
    const { expand, ...other } = props;
    return <IconButton {...other} />;
})(({ theme, expand }) => ({
    transform: !expand ? 'rotate(0deg)' : 'rotate(180deg)',
    marginLeft: 'auto',
    transition: theme.transitions.create('transform', {
        duration: theme.transitions.duration.shortest,
    }),
}));

function SevenApp(props) {
    const [expanded, setExpanded] = React.useState(false);

    const handleExpandClick = () => {
        setExpanded(!expanded);
    };


    //사진 바꾸기
    const [photo,setPhoto]=useState('1');

    return (
        <div>
            <h5 className='alert alert-info'>SevenApp_mui실습</h5>
            <Card sx={{ maxWidth: 345 }}>
                <CardHeader
                    avatar={
                        <Avatar sx={{ bgcolor: red[500] }} aria-label="recipe">
                            R
                        </Avatar>
                    }
                    action={
                        <IconButton aria-label="settings">
                            <MoreVertIcon />
                        </IconButton>
                    }
                    title="Shrimp and Chorizo Paella"
                    subheader="September 14, 2016"
                />
                <CardMedia
                    component="img"
                    height="194"
                    image={`../image2/${photo}.jpg`}
                    alt="Paella dish"
                />
                <CardContent>
                    <Typography variant="body2" color="text.secondary">
                        This impressive paella is a perfect party dish and a fun meal to cook
                        together with your guests. Add 1 cup of frozen peas along with the mussels,
                        if you like.
                    </Typography>
                </CardContent>
                <CardActions disableSpacing>
                    <IconButton aria-label="add to favorites">
                        <FavoriteIcon />
                    </IconButton>
                    <IconButton aria-label="share">
                        <ShareIcon />
                    </IconButton>
                    <ExpandMore
                        expand={expanded}
                        onClick={handleExpandClick}
                        aria-expanded={expanded}
                        aria-label="show more"
                    >
                        <ExpandMoreIcon />
                    </ExpandMore>
                </CardActions>
                <Collapse in={expanded} timeout="auto" unmountOnExit>
                    <CardContent>
                        <Typography paragraph>Method:</Typography>
                        <Typography paragraph>
                            Heat 1/2 cup of the broth in a pot until simmering, add saffron and set
                            aside for 10 minutes.
                        </Typography>
                        <Typography paragraph>
                            Heat oil in a (14- to 16-inch) paella pan or a large, deep skillet over
                            medium-high heat. Add chicken, shrimp and chorizo, and cook, stirring
                            occasionally until lightly browned, 6 to 8 minutes. Transfer shrimp to a
                            large plate and set aside, leaving chicken and chorizo in the pan. Add
                            pimentón, bay leaves, garlic, tomatoes, onion, salt and pepper, and cook,
                            stirring often until thickened and fragrant, about 10 minutes. Add
                            saffron broth and remaining 4 1/2 cups chicken broth; bring to a boil.
                        </Typography>
                        <Typography paragraph>
                            Add rice and stir very gently to distribute. Top with artichokes and
                            peppers, and cook without stirring, until most of the liquid is absorbed,
                            15 to 18 minutes. Reduce heat to medium-low, add reserved shrimp and
                            mussels, tucking them down into the rice, and cook again without
                            stirring, until mussels have opened and rice is just tender, 5 to 7
                            minutes more. (Discard any mussels that don&apos;t open.)
                        </Typography>
                        <Typography>
                            Set aside off of the heat to let rest for 10 minutes, and then serve.
                        </Typography>
                    </CardContent>
                </Collapse>
            </Card>

            {/* 오늘의 과제 */}

            <div>
                <h3>좋아하는 음식을 선택하세요</h3>
                <select onChange={(e)=>{
                    setPhoto(e.target.value);
                }}>
                    {/* value값 따로 안주고 text에 해당 value로 주면 text를 읽어서 그대로 value값 으로 읽는다 */}
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option value='4'>Food4</option>
                    <option value='5'>Food5</option>
                    <option value='6'>Food6</option>
                    <option value='7'>Food7</option>
                    <option value='8'>Food8</option>
                    <option value='9'>Food9</option>
                    <option value='10'>Food10</option>
                </select>
            </div>

            <div>
                <h3>배열 생성 후 음식이미지 선택하기</h3>
                <select onChange={(e)=>{
                    setPhoto(e.target.value);
                }}>
                    {
                        //1~10까지 반복해서 option제공
                        // 배열 생성과 동시에 바로 값 부여
                        // ...new Array(10) ... 1~10번까지
                        // index를 주어야 1~10번의 번호(index+1)를 줄 수 있음
                        // 여기서 a는 안줘도 되는데 준 값
                        // 지금은 사진 이름이 1~10이 되기때문에 쓸 수 있는 방법...이렇지 않을경우 따로 배열 선언해서 사용해야함
                        [...new Array(10)].map((a,index)=>(<option>{index+1}</option>))
                    }
                </select>
            </div>

        </div>
    );
}

export default SevenApp;