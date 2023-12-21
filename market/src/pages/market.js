import {useState,useEffect} from "react";
import {useNavigate} from "react-router-dom";
import axios from "axios";
import {Web3} from "web3";
import nft_abi from "../web3/nft_abi";
import BGimg from "../images/marketplace_background.png"
import Title from "../images/marketplace_title.png"
import {Button,Box,Typography} from "@mui/material";
// components
import Search from "../components/Search"
import MetamaskConnection from "../components/MetamaskConnection";
import NFTcard from "../components/NFTcard";




function Market() {
    const [items,setItems] = useState([]);
    const [connected, setConnected] = useState(false);
    const [account, setAccount] = useState([]);
    const [web3, setWeb3] = useState(null);
    const [nftcontract, setNftcontract] = useState(null);
    const nftContractAddress = "0x26358547718cA8c272C285a1d3161131570F480B";
    const navigate = useNavigate();
    // const provider = window.ethereum;
    // const web3 = new Web3(provider);

     useEffect(async ()=>{
        checkMetamaskConnection();
        // console.log(nft_abi.nft_abi)
        const _web3 = await initWeb3();
        const accounts = await _web3.eth.getAccounts();
        setAccount(accounts[0]);
        setWeb3(_web3);
        const _nftContract = await initContract(_web3, nft_abi.nft_abi, nftContractAddress);
        setNftcontract(_nftContract);
    },[]);
      // useEffect(() => {

    const initWeb3 = async () =>{
        try{
            const provider = window.ethereum;
            const web3 = new Web3(provider);
            return web3;

        }catch(e){
            console.log(`Error initializing web3:${e}`)
        }
    }

    const initContract = async (web3instance,contractABI, contractAddress)=>{
        const nftContract = new web3instance.eth.Contract(contractABI, contractAddress)
        return nftContract;
    }

    const checkMetamaskConnection = async ()=>{
        if(window.ethereum){
            try{
                // console.log(nftContractAddress)
                await window.ethereum.enable();
                setConnected(true);
                // console.log(`web3instance : ${_web3}`);
                // console.log(`nftContract:${nftcontract}`);
            }
            catch(e){
                console.error('Error connecting to Metamask:', e);

            }
        }else{
            console.warn('Metamask not found. Please install Metamask.');
        }
    }
    useEffect(async ()=>{
        // console.log(await getMarketItemList())
        const marketNFTs = await getMarketItemList();
        // TODO : 404 Error fixing
        console.log(marketNFTs)
        if (marketNFTs.data){
            setItems(marketNFTs.data);
        }else{
            console.log("no data")
        }
    },[])

    const getMarketItemList = async ()=>{
        const result = await axios.get("http://tvstorm-ai.asuscomm.com:12300/flower/market/");
        // console.log(result)
        return result
    }

  return (
    <div className="Market" style={{
        backgroundColor:"black",
        background:`url(${BGimg})`,
        backgroundRepeat:"no-repeat",
        backgroundSize:"100vw 100vh",
        width:"100vw",
        height:"100vh",
        display:"flex",
        flexDirection:"column",
    }}>
        <Box  className = "header" sx={{
            display:"flex",
            justifyContent:"space-between",
            margin:"10px",

        }}>
      <div className="MarketTitle" style={{
          backgroundImage:`url(${Title})`,
          backgroundRepeat:"no-repeat",
          backgroundSize:"100%",
          width:"400px",
          height:"60px",
          margin:"20px"
      }}/>
            <Box className = "MypageAndWallet" sx ={{
                display:"flex",
                width:"250px",
                justifyContent:"space-evenly",
                height:"30px",
                alignItems:"center",
                marginTop:"20px"
            }}>
         <Button variant="contained" color="success" onClick={()=>{
             navigate(`/mypage/${account}`)
         }}>Mypage</Button>

                  <Box className = "WalletConnect" sx={{
                      display:"flex",
                      // flexDirection:""
                      marginLeft:"10px",
                      marginRight:"50px",
                      backgroundColor: 'rgba(255, 255, 255, 0.5)',
                      width:"200px",
                      height:"100%",
                      borderRadius:"10px",
                      justifyContent:"space-evenly",
                      alignItems:"center",
                      margin:"0.1rem"
                  }}>
                      <Typography variant={"body1"} >wallet connection</Typography>
                      <MetamaskConnection connected={connected}/>
                 </Box>
                </Box>
            </Box>

        <Box className="SearchAndItems" sx={{
            display:"flex",
            flexDirection:"column",
            alignItems:"center"
        }}>
            <Search/>
            {items.length > 0 ? (
              items.map((item) => (
                <NFTcard  NFTitem={item} account={account} nftcontract = {nftcontract}/>
              ))
            ) : (
              <div>No NFT list</div>

            )}
        </Box>
    </div>
  );
}

export default Market;
