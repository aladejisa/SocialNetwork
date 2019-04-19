# -*- coding:utf-8 -*-
'''
Created on 2016年10月3日

@author: MQ
'''
import MySQLdb
import exConfig as CONFIG

class dbManager2():
    def __init__(self,dbname,host=CONFIG.MYSQL_SERVER_IP,user= CONFIG.MYSQL_USERNAME,passwd=CONFIG.MYSQL_PWD,port=3306,use_unicode=1,charset='utf8'):
        self.__host = host
        self.__user = user
        self.__passwd = passwd
        self.__port = port
        self.__charset = charset
        self.__conn=MySQLdb.connect(host=self.__host,user=self.__user,passwd=self.__passwd,port=self.__port,charset=self.__charset)
        self.__conn.select_db(dbname)
        self.__cur = self.__conn.cursor()

    def executeSelect(self,sql):
        self.__cur.execute(sql)
        resultLs = self.__cur.fetchall()
        return resultLs

    def execute(self,sql):
        self.__cur.execute(sql)
        self.__conn.commit()

    def executemany(self,sql,values):
        self.__cur.executemany(sql,values)
        self.__conn.commit()


    def release(self):
        if self.__cur != None:
            self.__cur.close()
        if self.__conn != None:
            self.__conn.close()
