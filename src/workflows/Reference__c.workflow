<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Referral_Email_Notification</fullName>
        <description>Referral Email Notification</description>
        <protected>false</protected>
        <recipients>
            <field>Employer_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Job_Reference_Letter</template>
    </alerts>
    <rules>
        <fullName>Referral Email Notification</fullName>
        <actions>
            <name>Referral_Email_Notification</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Reference__c.Employer_Email__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
