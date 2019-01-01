<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>New_Youth_Registration</fullName>
        <description>New Youth Registration</description>
        <protected>false</protected>
        <recipients>
            <recipient>Mentors</recipient>
            <type>group</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/New_User_Registration</template>
    </alerts>
    <alerts>
        <fullName>Youth_CV_Template_for_Business_Analyst_Email_Alert</fullName>
        <description>Youth CV Template for Business Analyst Email Alert</description>
        <protected>false</protected>
        <recipients>
            <field>Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/CV_Template_for_Business_Analyst</template>
    </alerts>
    <alerts>
        <fullName>Youth_CV_Template_for_Business_Management_Fresher_Email_Alert</fullName>
        <description>Youth CV Template for Business Management Fresher Email Alert</description>
        <protected>false</protected>
        <recipients>
            <field>Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/CV_Template_for_Business_Management_Experience</template>
    </alerts>
    <alerts>
        <fullName>Youth_CV_Template_for_Chef_Email_Alert</fullName>
        <description>Youth CV Template for Chef Email Alert</description>
        <protected>false</protected>
        <recipients>
            <field>Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/CV_Template_for_Chef</template>
    </alerts>
    <alerts>
        <fullName>Youth_CV_Template_for_General_Duty_Email_Alert</fullName>
        <description>Youth CV Template for General Duty Email Alert</description>
        <protected>false</protected>
        <recipients>
            <field>Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/CV_Template_for_General_Duty</template>
    </alerts>
    <alerts>
        <fullName>Youth_CV_Template_for_IT_Experienced_Email_Alert</fullName>
        <description>Youth CV Template for IT Experienced Email Alert</description>
        <protected>false</protected>
        <recipients>
            <field>Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/CV_Template_for_IT_Experienced</template>
    </alerts>
    <alerts>
        <fullName>Youth_CV_Template_for_IT_Support_Fresher_Email_Alert</fullName>
        <description>Youth CV Template for IT Support Fresher Email Alert</description>
        <protected>false</protected>
        <recipients>
            <field>Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/CV_Template_for_IT_Support_Fresher</template>
    </alerts>
    <fieldUpdates>
        <fullName>Youth_Account_Record_Type_Assignment</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Youth_Group</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Youth Account Record Type Assignment</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>New Youth Registration Alert</fullName>
        <actions>
            <name>New_Youth_Registration</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Type</field>
            <operation>equals</operation>
            <value>Sanatan Yuva</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Youth CV Template for Business Analyst</fullName>
        <actions>
            <name>Youth_CV_Template_for_Business_Analyst_Email_Alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>Youth Group</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.CV_Template_Types__c</field>
            <operation>equals</operation>
            <value>Business Analyst</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Youth CV Template for Business Management Experience</fullName>
        <actions>
            <name>Youth_CV_Template_for_Business_Management_Fresher_Email_Alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>Youth Group</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.CV_Template_Types__c</field>
            <operation>equals</operation>
            <value>Business Management Experience</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Youth CV Template for Business Management Fresher</fullName>
        <actions>
            <name>Youth_CV_Template_for_Business_Analyst_Email_Alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>Youth Group</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.CV_Template_Types__c</field>
            <operation>equals</operation>
            <value>Business Management Fresher</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Youth CV Template for Chef</fullName>
        <actions>
            <name>Youth_CV_Template_for_Chef_Email_Alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>Youth Group</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.CV_Template_Types__c</field>
            <operation>equals</operation>
            <value>Chef</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Youth CV Template for General Duty</fullName>
        <actions>
            <name>Youth_CV_Template_for_General_Duty_Email_Alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>Youth Group</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.CV_Template_Types__c</field>
            <operation>equals</operation>
            <value>General Duty</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Youth CV Template for IT Experienced</fullName>
        <actions>
            <name>Youth_CV_Template_for_IT_Support_Fresher_Email_Alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>Youth Group</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.CV_Template_Types__c</field>
            <operation>equals</operation>
            <value>IT Experienced</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Youth CV Template for IT Support Fresher</fullName>
        <actions>
            <name>Youth_CV_Template_for_IT_Support_Fresher_Email_Alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>Youth Group</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.CV_Template_Types__c</field>
            <operation>equals</operation>
            <value>IT Support Fresher</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
