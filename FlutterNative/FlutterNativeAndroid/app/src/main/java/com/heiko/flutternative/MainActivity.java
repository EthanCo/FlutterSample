package com.heiko.flutternative;

import android.os.Bundle;
import android.support.v4.app.FragmentTransaction;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.FrameLayout;

import io.flutter.facade.Flutter;

public class MainActivity extends AppCompatActivity {
    private Button btnFlutterCreateView;
    private Button btnFlutterFragment;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        btnFlutterCreateView = findViewById(R.id.btn_flutter_create_view);
        btnFlutterCreateView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                View flutterView = Flutter.createView(MainActivity.this, getLifecycle(), "route1");
                FrameLayout.LayoutParams layout = new FrameLayout.LayoutParams(600, 800);
                layout.leftMargin = 100;
                layout.rightMargin = 200;
                addContentView(flutterView, layout);
            }
        });

        btnFlutterFragment = findViewById(R.id.btn_flutter_fragment);
        btnFlutterFragment.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                FragmentTransaction tx = getSupportFragmentManager().beginTransaction();
                tx.replace(R.id.layout_container, Flutter.createFragment("route1"));
                tx.commit();
            }
        });
    }
}
