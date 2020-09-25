const Http = new XMLHttpRequest();

function AddFavoriteItem(button, itemId)
{
    var url = 'CAPSTONE/addFav?itemId=' + itemId + '&action=0';
    console.log(url);
    Http.open("GET", url);
    Http.send();
}


function Reorder(reorder) {
    var order = document.getElementById("reorder" + reorder).innerText;
    var itemsInfo = order.split(",");
    var cart = localStorage.getItem("items");
    var cartObj = JSON.parse(cart);
    if (cartObj === null)
    {
        cartObj = [];
    }
    //console.log("Expecting: 1, Getting: " + itemsInfo[12]);
    //What it should be seeing: [1,VEGETABLE SAMOSAS,3.95,1,3,PAPDI (PAPRI) CHAAT,6.95,1,7,PANEER PAKORA,9.95,1]
    for (var i = 0; (i + 4) <= itemsInfo.length; i = i + 4) {
        let Item =
                {
                    id: itemsInfo[i],
                    name: itemsInfo[i + 1],
                    quantity: itemsInfo[i + 2],
                    price: itemsInfo[i + 3]
                };
        for (var j = 0; j < cartObj.length; j++)
        {
            if (cartObj[j].name === Item.name)
            {
                cartObj.splice(j, 1);

            }
        }
        cartObj.push(Item);
    }
    localStorage.setItem("items", JSON.stringify(cartObj));
    alert("Items added to cart!");
}


function AddToOrder(itemId, price, divname)
{
    var qty = document.getElementById("qty" + itemId).value;
    var name = document.getElementById(divname).innerHTML;
//    console.log("qty: " + qty);


    var cart = localStorage.getItem("items");
    var cartObj = JSON.parse(cart);

    if (cartObj === null)
    {
        cartObj = [];
    }


    let latestItem =
            {
                id: itemId,
                name: name,
                quantity: qty,
                price: price
            };

    for (var i = 0; i < cartObj.length; i++)
    {
        if (cartObj[i].name === latestItem.name)
        {
            cartObj.splice(i, 1);

        }
    }
    alert(latestItem.id);
    cartObj.push(latestItem);
    localStorage.setItem("items", JSON.stringify(cartObj));
}