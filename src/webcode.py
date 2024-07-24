#
# import nltk
#
# nltk.download('vader_lexicon')

from flask import *
import uuid

from src.sentimental import sent

app=Flask(__name__)
from src.dbconnector import *

app.secret_key="123"




import functools
def login_required(func):
    @functools.wraps(func)
    def secure_function():
        if "lid" not in session:
            return redirect ("/")
        return func()
    return secure_function

@app.route("/logout")
# @login_required

def logout():
    session.clear()
    return render_template("login.html")







@app.route('/')
def log():
    # return render_template('indexvoice.html')
    return render_template('login.html')

@app.route('/login',methods=['post'])
def login():
    uname=request.form['textfield']
    pword=request.form['textfield2']
    qry="SELECT * FROM `login` WHERE `username`=%s AND `password`=%s"
    val=(uname,pword)
    res=selectone(qry,val)
    if res is None:
        return '''<script>alert('invalid enrty');window.location="/"</script>'''
    else:
        if res[3]=='admin':
            session['lid']=res[0]
            return '''<script>alert('welcome');window.location="/adminhome"</script>'''
        elif res[3] == 'shop':
            session['lid']=res[0]
            return '''<script>alert('welcome');window.location="/shophome"</script>'''
        elif res[3] == 'user':
            session['lid']=res[0]
            return '''<script>alert('welcome');window.location="/userhome"</script>'''
        else:
            return '''<script>alert('invalid entry');window.location="/"</script>'''



@app.route('/adminhome')
def adminhome():
    return render_template('adminhome.html')


@app.route('/viewusers')
@login_required
def viewusers():
    qry="SELECT * FROM `user_reg` join login on login.id=user_reg.lid and login.type='user'"
    res=select(qry)
    return render_template('view users.html',val=res)

@app.route('/viewfeedback')
@login_required
def viewfeedback():
    qry="SELECT `feedback`.*,`user_reg`.`firstname`,`lastname` FROM `feedback` JOIN `user_reg` ON `feedback`.`useerid` =`user_reg`.`lid`"
    res=select(qry)
    return render_template('viewfeedback.html',val=res)


@app.route('/blockunblock')
@login_required
def blockunblock():
    qry="SELECT `user_reg`.*,`login`.`type` FROM `login` JOIN `user_reg` ON `user_reg`.`lid`=`login`.`id`"
    res=select(qry)
    return render_template('blockunblockusers.html',val=res)

@app.route('/block')
def block():
    id=request.args.get('id')
    qry="UPDATE `login` SET `type`='block' WHERE `id`=%s"
    val=str(id)
    iud(qry,val)
    return  '''<script>alert("blocked....!!!!");window.location="/blockunblock"</script>'''
@app.route('/unblock')
def unblock():
    id=request.args.get('id')
    qry="UPDATE `login` SET `type`='user' WHERE `id`=%s"
    val=str(id)
    iud(qry,val)
    return  '''<script>alert("unblocked....!!!!");window.location="/blockunblock"</script>'''



@app.route('/approveshop')
@login_required
def approveshop():
    qry="SELECT `shop_reg`.*,`login`.`type` FROM `shop_reg` JOIN `login` ON `shop_reg`.`lid`=`login`.`id` WHERE `login`.`type`='pending'"
    res=select(qry)

    return render_template('approve shop.html',val=res)


@app.route('/approve')
def approve():
    id=request.args.get('id')
    qry="UPDATE `login` SET `type`='shop' WHERE `id`=%s"
    val=str(id)
    iud(qry,val)
    return '''<script>alert("Approved....!!!!");window.location="/approveshop"</script>'''


@app.route('/viewcomplantandreply')
@login_required
def viewcomplantandreply():
    qry="SELECT `user_reg`.`firstname`,`user_reg`.`lastname` ,`complaint`.* FROM `user_reg` JOIN `complaint` ON `complaint`.`user_id`=`user_reg`.`lid` WHERE `complaint`.`reply`='pending'"
    res=select(qry)
    return render_template('view complant and reply.html',val=res)

@app.route('/reply')
def reply():
    id=request.args.get('id')
    session['cid']=id

    return render_template('send reply.html')

@app.route('/reply1',methods=['post'])
def reply1():
    id=session['cid']
    reply=request.form['textarea']
    qry="UPDATE `complaint` SET `reply`=%s WHERE `id`=%s"
    val=(reply,str(id))
    iud(qry,val)

    return'''<script>alert("Replyed...!!!");window.location="/viewcomplantandreply"</script>'''





@app.route('/viewrating')
@login_required
def viewrating():
    qry = "SELECT `shop_reg`.`shopname`,`review`.`rating`,`review`.`date`,`product`.`shop_id` FROM `review` JOIN  `product` ON `product`.`id`=`review`.`productid` JOIN `shop_reg` ON `shop_reg`.`lid`=`product`.`shop_id`"
    res = select(qry)
    return render_template('view rating.html',val=res)


# __________________________________________SHOP_____________________________________________________



@app.route('/shophome')
def shophome():

    return render_template('shophome.html')

@app.route('/shopreg')
def shopreg():


    return render_template('shopreg.html')


@app.route('/shopreg1',methods=['post'])
def shopreg1():
    try:
        shop = request.form['textfield']
        place = request.form['textfield2']
        post = request.form['textfield3']

        pin = request.form['textfield4']
        phone = request.form['textfield5']
        uname = request.form['textfield6']
        paswrd = request.form['textfield7']

        qry = "insert into login values(null,%s,%s,'pending')"
        val = (uname, paswrd)
        login_id = iud(qry, val)
        qrynew = "insert into shop_reg values(null,%s,%s,%s,%s,%s,%s)"
        val1 = (shop, place, post, pin, phone, login_id)
        iud(qrynew, val1)
        return '''<script>alert("sucess");window.location="/"</script>'''
    except Exception as e:
        return '''<script>alert("Duplicate entry");window.location="/shopreg"</script>'''



@app.route('/addoffers')
@login_required
def addoffers():
    qry="select * from product"
    res=select(qry)

    return render_template('addoffers.html',val=res)

@app.route('/addoffers1',methods=['post'])
def addoffers1():
    product=request.form['select']

    offer=request.form['textarea']

    qry = "insert into offer values(null,%s,%s,curdate())"
    val = (product, offer)
    iud(qry, val)

    return'''<script>alert("Added...!!!");window.location="/shophome"</script>'''


@app.route('/viewratingshop')
@login_required
def viewratingshop():
    qry="SELECT `shop_reg`.`shopname`, AVG(`review`.`rating`) FROM `review` JOIN `product` ON `product`.`id`=`review`.`productid` JOIN `shop_reg` ON `shop_reg`.`lid`=`product`.`shop_id` GROUP BY   `shop_reg`.`lid`"
    res=select(qry)
    return render_template('viewrating.html',val=res)


@app.route('/addandmanageproduct',methods=['post','get'])
@login_required
def addandmanageproduct():
    qry="SELECT * FROM `product` where `shop_id`=%s"
    val=session['lid']
    res=selectall(qry,val)
    return render_template('addandmanageproduct.html',val=res)
@app.route('/addproduct',methods=['post','get'])
def addproduct():

    return render_template("add product.html")


@app.route('/addproduct1',methods=['post','get'])
def addproduct1():
    image = request.files['image']
    path = 'static/images/'+str(uuid.uuid4())+image.filename
    image.save(path)
    product=request.form['textfield']
    description=request.form['textarea']
    price=request.form['textfield2']
    stock=request.form['textfield3']
    qry="insert into product values(null,%s,%s,%s,%s,%s,%s)"
    val=(product,description,price,stock,session['lid'],path)
    iud(qry,val)
    return'''<script>alert("Added...!!!");window.location="/addandmanageproduct"</script>'''

@app.route('/edit_product')
def edit_product():
    id = request.args.get('id')
    session['cid'] = id
    qry="select * from product where id=%s"
    val=(str(id))
    res=selectone(qry,val)
    return render_template("editproduct.html",val=res)

@app.route('/edit_product1',methods=['post'])
def edit_product1():
    product = request.form['textfield']
    description = request.form['textarea']
    price = request.form['textfield2']
    stock = request.form['textfield3']
    qry = "update product set`productname`=%s,`description`=%s,`price`=%s,`stock`=%s WHERE `id`=%s"
    val = (product, description, price, stock,session['cid'])
    iud(qry, val)
    return '''<script>alert("Edited...!!!");window.location="/addandmanageproduct"</script>'''


@app.route('/delete_product')
def delete_product():
    id=request.args.get('id')
    qry="delete from product where id=%s"
    val=str(id)
    iud(qry, val)

    return '''<script>alert("Deleted...!!!");window.location="/addandmanageproduct"</script>'''



@app.route('/viewbooking')
@login_required
def viewbooking():
    qry="SELECT `user_reg`.`firstname`,`user_reg`.`lastname`,`product`.*,`order`.* FROM `order` JOIN `product` ON `order`.`pid`=`product`.`id` JOIN `user_reg` ON `order`.`userId`=`user_reg`.`lid` where order.status='pending' "
    res=select(qry)
    return render_template('viewbooking.html',val=res)



@app.route('/accept')
def accept():
    id=request.args.get('id')
    qry="UPDATE `order` SET `status`='accpted' WHERE `id`=%s"
    val=str(id)
    iud(qry,val)
    return  '''<script>alert("Accepted...!!!");window.location="/viewbooking"</script>'''

@app.route('/reject')
def reject():
    id=request.args.get('id')
    qry="UPDATE `order` SET `status`='rejected' WHERE `id`=%s"
    val=str(id)
    iud(qry,val)
    return  '''<script>alert("rejected...!!!");window.location="/viewbooking"</script>'''



@app.route('/viewfeedbackshop')
@login_required
def viewfeedbackshop():
    qry = "SELECT `feedback`.*,`user_reg`.`firstname`,`lastname` FROM `user_reg` JOIN `feedback` ON `feedback`.`useerid`=`user_reg`.`lid`  "

    res = select(qry)
    return render_template('viewfeedbackshop.html',val=res)

@app.route('/viewcomplaintshop')
@login_required
def viewcomplaintshop():
    qry = "SELECT `user_reg`.`firstname`,`user_reg`.`lastname` ,`complaint`.* FROM `user_reg` JOIN `complaint` ON `complaint`.`user_id`=`user_reg`.`lid` "
    res = select(qry)

    return render_template('viewcomplaintshop.html',val=res)

@app.route('/replyshop')
def replyshop():
    id = request.args.get('id')
    session['cid'] = id

    return render_template("shopsendreply.html")

@app.route('/replyshop1',methods=['post'])
def replyshop1():
    id=session['cid']
    reply=request.form['textarea']
    qry="UPDATE `complaint` SET `reply`=%s WHERE `id`=%s"
    val=(reply,str(id))
    iud(qry,val)

    return'''<script>alert("Replyed...!!!");window.location="/viewcomplaintshop"</script>'''

# _____________________________________USER________________________________________________


@app.route('/userhome',methods=['post','get'])
def userhome():

    return render_template("userhome.html")

@app.route('/userreg')
def userreg():


    return render_template('user reg.html')
@app.route('/userreg1',methods=['post'])
def userreg1():
    try:
        fname = request.form['textfield']
        lname = request.form['textfield2']

        gender = request.form['radiobutton']
        place = request.form['textfield3']
        post = request.form['textfield4']
        pin = request.form['textfield5']
        Phone = request.form['textfield6']
        email = request.form['textfield7']
        uname = request.form['textfield8']
        paswrd = request.form['textfield9']

        qry = "insert into login values(null,%s,%s,'user')"
        val = (uname, paswrd)
        login_id = iud(qry, val)
        qrynew = "insert into user_reg values(null,%s,%s,%s,%s,%s,%s,%s,%s,%s)"
        val1 = ( fname, lname,gender,place,post,pin,Phone,email,login_id)
        print(val1)
        iud(qrynew, val1)
        return '''<script>alert("sucess");window.location="/"</script>'''
    except Exception as e:
        return '''<script>alert("Duplicate entry!!!!!");window.location="/userreg"</script>'''



@app.route('/userviewproduct',methods=['post','get'])
@login_required
def userviewproduct():
    qry = "SELECT product.*,AVG(`rating`) FROM `product` LEFT JOIN `review`  ON `product`.`id`=`review`.`productid` GROUP BY `product`.`id`"
    res = select(qry)

    return render_template("user view product.html",val=res)

@app.route('/index',methods=['post','get'])
def index():
    rr=request.form['speechText']
    print (rr)
    rr=rr.split(' ')[0]
    qry = "SELECT product.*,AVG(`rating`) FROM `product` LEFT JOIN `review`  ON `product`.`id`=`review`.`productid` where product.description like '%"+rr+"%' GROUP BY `product`.`id`"
    res = select(qry)
    qry = "SELECT product.*,AVG(`rating`) FROM `product` LEFT JOIN `review`  ON `product`.`id`=`review`.`productid` GROUP BY `product`.`id`"


    print (res)


    table='''
    
    <table id="customers">
    <tr>
      <th scope="col">Product name</th>
      <th scope="col">Image</th>
      <th scope="col">Description</th>
      <th scope="col">Price</th>
      <th  scope="col">Rating</th>
      <th scope="col">Stock</th>
      <th scope="col"></th>
      <th scope="col"></th>
    </tr>
    '''
    # ../ static / images /
    for i in res:
        table=table+' <tr>      <td>&nbsp;'+str(i[1])+' </td>      <td><img src="'+str(i[6])+'" height="180" width="100"></td>'
        table=table+ ' <td>&nbsp;'+str(i[2])+'</td>      <td>&nbsp;'+str(i[3])+'</td>      <td>&nbsp;'+str(i[7])+'</td> <td>&nbsp;'+str(i[4])+'</td>'

        table=table+'<td>&nbsp<a href="/viewoffer?id='+str(i[0])+'#about">Offer </a></td><td><a href="/book?id='+str(i[0])+'&price='+str(i[3])+'#about">Book </a></td>    </tr>'

    table=table+'</table>'
    print (table)

    return str(table)

@app.route('/userviewproduct_rating',methods=['get'])
@login_required
def userviewproduct_rating():
    product_id = request.args.get('id')
    qry = "SELECT * FROM review JOIN user_reg ON (`user_reg`.`id`=review.userid) WHERE productid = %s"
    val = product_id
    res = selectall(qry, val )
    return render_template("user view product_rating.html",val=res)


@app.route('/viewoffer',methods=['post','get'])
def viewoffer():
    id=request.args.get('id')
    qry="SELECT * FROM `offer` WHERE `pid`=%s"
    val=str(id)
    res=selectall(qry,val)
    print (res)
    if len(res) < 0:
        return '''<script>alert("Sorry...Currently no offers for this product!!");window.location="userviewproduct"</script>'''
    else:

        return render_template("user view offer.html",val=res)


@app.route('/book')
def book():
    price=request.args.get('price')
    product=request.args.get('id')
    session['product']=product
    session['price']=price

    return render_template("book product.html",price=price)

@app.route('/book1',methods=['post'])
def book1():
    Quantity=request.form['textfield']
    amount=request.form['textfield2']
    qry="INSERT INTO `order` VALUES(NULL,%s,%s,%s,%s,'pending')"
    val=(session['lid'],session['product'],Quantity,amount)
    iud(qry,val)

    return '''<script>alert("Booked!!");window.location="userviewproduct"</script>'''





@app.route('/userviewreply',methods=['post','get'])
@login_required
def userviewreply():
    qry = "select * from complaint where user_id=%s "
    val = session['lid']
    res = selectall(qry, val)

    return render_template("user view complaint and reply.html",val=res)


@app.route('/sendcomplaint',methods=['post','get'])
def sendcomplaint():


    return render_template("send complaint.html")


@app.route('/sendcomplaint1', methods=['post', 'get'])
def sendcomplaint1():
    complaint=request.form['textarea']
    qry="insert into complaint values(null,%s,%s,curdate(),'pending')"
    val=(session['lid'],complaint)
    iud(qry,val)
    return'''<script>alert("send..!!");window.location="userviewreply"</script>'''

@app.route('/userviewbookingstatus',methods=['post','get'])
@login_required
def userviewbookingstatus():

    qry="SELECT `product`.`productname`,`order`.*,`order`.`status` FROM `order` JOIN `product` ON `order`.`pid`=`product`.`id` WHERE `order`.`userid`=%s "
    val=session['lid']
    res=selectall(qry,val)
    print(res)
    return render_template("user viewbooking status.html",val=res)


@app.route('/feedbackandrating',methods=['post','get'])
@login_required
def feedbackandrating():

    return render_template("user send feedback and rating.html")

@app.route('/feedbackandrating1',methods=['post','get'])
def feedbackandrating1():

    feedback=request.form['textarea']

    qry = "INSERT INTO `feedback` VALUES(NULL,%s,CURDATE(),%s)"
    val = (feedback,session['lid'])
    iud(qry, val)
    return '''<script>alert("send..!!");window.location="/userhome"</script>'''


@app.route('/addreview',methods=['post','get'])
@login_required
def addreview():
    qry="select * from product"
    res=select(qry)

    return render_template("user send review.html",val=res)



@app.route('/addreview1',methods=['post','get'])
def addreview1():
    product= request.form['select']
    print(product)
    review=request.form['textarea']
    rate=sent(review)
    qry="INSERT INTO `review` VALUES(NULL,%s,%s,CURDATE(),%s,%s)"
    val=(session['lid'],review,product,rate)
    iud(qry,val)
    return '''<script>alert("send..!!");window.location="/userhome"</script>'''
































app.run(debug=True)