<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Puja_Confirmation</fullName>
        <description>Puja Confirmation</description>
        <protected>false</protected>
        <recipients>
            <field>Devotee_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Puja_Confirmation</template>
    </alerts>
    <rules>
        <fullName>Puja Confirmation</fullName>
        <actions>
            <name>Puja_Confirmation</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Task.Status</field>
            <operation>equals</operation>
            <value>Confirmed</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
