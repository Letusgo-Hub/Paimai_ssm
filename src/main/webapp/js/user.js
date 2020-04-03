new Vue({
    el: "#app",
    data: {
         product:{
             productName:"",
             pdescribe:"",
             startbid:"",
             nowbid:"",
             productsort:"",
             pendtime:"",
             productstatue:"",
             Picturerul:""
         },
        indexKey:0,
        tabList:[
            {
                type:'美术',
                list:[]
            },
            {
                type:'珠宝',
                    list:[]
            },
            {
                type:'手表',
                    list:[]
            },
            {
                type:'艺术',
                    list:[]
            }
        ],

    },
    methods: {
        findAllProduct() {
            //this是指vue的对象，而_this是相应的数据的
            axios.post("/Paimai_ssm/vueproduct/findAllProduct.do").then( (response) => {
                var data = response.data;
                console.log(data)
                data.forEach((item,index)=>{
                        if(index<8){
                            this.tabList[0].list.push({
                                picUrl:'/Paimai_ssm/'+ item.pictureURL,
                                ...item
                            })
                        }else if(index>=8&&index<=15){
                            this.tabList[1].list.push({
                                picUrl:'/Paimai_ssm/'+ item.pictureURL,
                                ...item
                            })
                        }else if(index>=16&&index<=23){
                            this.tabList[2].list.push({
                                picUrl:'/Paimai_ssm/'+ item.pictureURL,
                                ...item
                            })
                        }else{
                                this.tabList[3].list.push({
                                    picUrl:'/Paimai_ssm/'+item.pictureURL,
                                    ...item
                                })
                         }

                });
            }).catch( (error)=> {
                console.log(error);
            });
        },change(index){
            this.indexKey = index;
        }
    },
    //当页面加载触发请求查询内容
    created(){
        this.findAllProduct();
    }
});