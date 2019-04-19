# -*- coding:utf-8 -*-  
'''
Created on 2017年3月27日

@author: MQ
'''
from pylouvain import PyLouvain
from dbManager2 import dbManager2
import datetime
import time

def findGZCommunity():
    dbm = dbManager2('sina11',host='127.0.0.1',passwd='root')
    pyl = PyLouvain.from_db(dbm,"select uid,fid from afrelation11 limit 0,10000")
    partition, q = pyl.apply_method()
    values = []
    j = 0
    print partition
    f = open("output.txt","w")
    f.write(str(partition))
    f.close()
#     for item in partition:
#         for i in item:
#             values.append((pyl.node_map[i],j))
#         j = j+1
#     sql = "insert ignore agzcommunityLabel values (%s,%s)"
#     dbm.executemany(sql, values) 

if __name__ == '__main__':
    findGZCommunity()
#     findJHCommunity()
    

    
    