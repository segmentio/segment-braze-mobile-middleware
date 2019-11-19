package com.example.segmentbrazedebounce_android;

import androidx.appcompat.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import com.segment.analytics.Analytics;

public class MainActivity extends AppCompatActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Button sendButton = findViewById(R.id.sendButton);

        sendButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // TODO Auto-generated method stuff
                EditText textField = findViewById(R.id.usernameText);
                Analytics.with(getApplicationContext()).identify(textField.getText().toString());
                Log.println(Log.INFO, "", textField.getText().toString());
            }
        });
    }
}
