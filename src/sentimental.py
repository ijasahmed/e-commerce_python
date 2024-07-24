def sent(k):
    import nltk
    from nltk.sentiment.vader import SentimentIntensityAnalyzer
    pstv=0
    ngtv=0
    ntl=0
    sid = SentimentIntensityAnalyzer()
    ss = sid.polarity_scores(k)
    a = float(ss['pos'])
    b = float(ss['neg'])
    c = float(ss['neu'])
    rating = 2.5
    if (ss['neu'] > ss['pos'] and ss['neu'] > ss['neg']):
        pass
    if (ss['neg'] > ss['pos']):
        negva = 5 - (5 * ss['neg'])
        if negva > 2.5:
            negva = negva - 2.5
        rating = negva
    else:
        negva = 5 * ss['pos']
        if negva < 2.5:
            negva = negva + 2.5
        rating = negva

    # cmd.execute("insert into `product_rate` VALUES(null,'"+pid+"','"+str(rating)+"') ")
    # con.commit()
    # print(rating)
    return str(rating)
# sent("good")